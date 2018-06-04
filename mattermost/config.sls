{% from "mattermost/map.jinja" import mattermost with context %}

mattermost_config:
  file.managed:
    - name: {{ mattermost.config_file }}
    - source: {{ mattermost.config_file_source }}
    - template: jinja
    - user: {{ mattermost.user }}
    - group: {{ mattermost.group }}
    - mode: 644
