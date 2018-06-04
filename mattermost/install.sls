{% from "mattermost/map.jinja" import mattermost with context %}

mattermost_install:
  archive.extracted:
    - name: {{ mattermost.install_dir }}
    - source: https://releases.mattermost.com/{{ mattermost.version }}/mattermost-team-{{ mattermost.version }}-linux-amd64.tar.gz
    - user: mattermost
    - group: mattermost
    - archive_format: tar
    - options: z
    - skip_verify: True
