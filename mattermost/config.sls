{% from "mattermost/map.jinja" import mattermost with context %}

{% set config_file = salt['pillar.get']('mattermost:global.config_file_path', mattermost.config_file) %}
mattermost_config:
  file.managed:
    - name: {{ config_file }}
    - source: {{ mattermost.config_file_source }}
    - template: jinja
    - user: {{ mattermost.user }}
    - group: {{ mattermost.group }}
    - mode: 644
