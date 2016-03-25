tmux-config:
  file.managed:
    - name: /root/.tmux.conf
    - source: salt://core/files/tmux.conf
