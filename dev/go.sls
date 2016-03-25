go:
  archive.extracted:
    - name: /usr/local
    - source: https://storage.googleapis.com/golang/go1.6.linux-amd64.tar.gz
    - source_hash: sha256=5470eac05d273c74ff8bac7bef5bad0b5abbd1c4052efbdbc8db45332e836b0b
    - archive_format: tar
    - tar_options: v
    - if_missing: /usr/local/go
  file.symlink:
    - name: /usr/local/bin/go
    - target: /usr/local/go/bin/go
