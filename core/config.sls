tmux-config:
  file.managed:
    - name: /root/.tmux.conf
    - source: salt://core/files/tmux.conf

git-config:
  file.managed:
    - name: /root/.gitconfig
    - source: salt://core/files/gitconfig
