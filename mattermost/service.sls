{% from "mattermost/map.jinja" import mattermost with context %}

mattermost_service_file:
  file.managed:
    - name: {{ mattermost.service_file }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: {{ mattermost.service_file_source }}

mattermost_service:
  {% if salt['pillar.get']('mattermost:global:enabled', True) %}
    service.running:
      - name: mattermost
      - enable: True
      - reload: True
      - require:
        - sls: mattermost.install
        - file: mattermost_service_file
  {% else %}
    service.dead:
      - name: mattermost
      - enable: False
  {% endif %}
