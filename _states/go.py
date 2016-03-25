import logging
import shutil
import glob

log = logging.getLogger(__name__)

class ShouldReturnError(Exception):
    pass


def _check_return(ret, all_changes):
    if not ret['result']:
        raise ShouldReturnError()
    if len(ret['changes']) != 0:
        all_changes[ret['name']] = ret['changes']
    return all_changes


def _error(name, changes, comment):
    return {
        'name': name,
        'changes': changes,
        'result': False,
        'comment': comment
    }


def _ok(name, changes):
    return {
        'name': name,
        'changes': changes,
        'result': True,
        'comment': '%s is in the correct state' % name
    }


def _go_get(gopath, repo):
    retcode = __salt__['go.get'](gopath, repo)
    if retcode != 0:
        return _error('go get ' + repo, {}, 'retcode={0}'.format(retcode))
    return _ok('go get '+ repo, {'repo': 'was go gotten'})


def _go_build(gopath, package):
    retcode = __salt__['go.build'](gopath, package)
    if retcode != 0:
        return _error('go build ' + package, {}, 'retcode={0}'.format(retcode))
    return _ok('go build '+ package, {package: 'was go built'})


def workspace(name, packages=[]):
    all_changes = {}
    try:
        for package in packages:
            log.debug('Beginning go get %s', package)
            ret = _go_get(name, package)
            log.debug('go get %s returned %s', package, str(ret))
            all_changes = _check_return(ret, all_changes)
            log.debug('Beginning go build %s', package)
            ret = _go_build(name, package)
            log.debug('go build %s returned %s', package, str(ret))
            all_changes = _check_return(ret, all_changes)
        for binary in glob.glob(name + '/bin/*'):
            try:
                shutil.copy(binary, '/usr/local/bin')
            # hack warning: gocode errors if you don't shut it down first
            except:
                pass
    except ShouldReturnError:
        return _error(name, all_changes, ret['comment'])
    return _ok(name, all_changes)
