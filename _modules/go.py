def get(gopath, repo):
    return __salt__['cmd.retcode']('go get -u -v {0}'.format(repo), env={'GOPATH': gopath})


def build(gopath, package):
    return __salt__['cmd.retcode']('go build {0}'.format(package), env={'GOPATH': gopath})
