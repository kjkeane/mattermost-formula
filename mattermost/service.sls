{% from "mattermost/map.jinja" import mattermost with context %}

{% set service_file = salt['pillar.get']('mattermost:global:service_file_path', mattermost.service_file_path) %}
mattermost_systemd:
  file.managed:
    - name: {{ service_file }}
    - user: root
    - group: root
    - mode: 644
    - template: jinja
    - source: salt://mattermost/templates/mattermost-service.jinja

mattermost_service:
  {% if salt['pillar.get']('mattermost:global:enabled', True) %}
    service.running:
      - name: mattermost
      - enable: True
      - reload: True
      - require:
        - sls: mattermost.install
        - file: mattermost_systemd
  {% else %}
    service.dead:
      - name: mattermost
      - enable: False
  {% endif %}
