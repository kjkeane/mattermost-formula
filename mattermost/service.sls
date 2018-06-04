{% from "mattermost/map.jinja" import mattermost with context %}

mattermost_systemd:
  file.managed:
    - name: {{ mattermost.service_file_path }}
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
