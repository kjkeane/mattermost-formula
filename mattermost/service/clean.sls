# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}

mattermost-service-clean-service-dead:
  service.dead:
    - name: mattermost
    - enable: False
  file.absent:
    - name: {{ mattermost.service.file }}
    - require:
      - service: mattermost-service-clean-service-dead
  cmd.run:
    - onlyif: {{ grains.kernel|lower == 'linux' }}
    - name: systemctl daemon-reload
    - onchanges:
      - file: mattermost-service-clean-service-dead
