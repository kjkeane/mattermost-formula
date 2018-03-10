mattermost_systemd:
  file.managed:
    - name: /etc/systemd/system/mattermost.service
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
        - file: mattermost_systemd
        - sls: mattermost.install
  {% else %}
    service.dead:
      - name: mattermost
      - enable: False
  {% endif %}
