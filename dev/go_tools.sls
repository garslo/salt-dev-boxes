{% set repo_base = '/opt/repos' %}
{% set ws = repo_base + "/tools-ws" %}

{{repo_base}}:
  file.directory:
    - makedirs: True
  go.workspace:
    - packages:
      - github.com/nsf/gocode
      - golang.org/x/tools/cmd/goimports
