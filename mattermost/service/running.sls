# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_file = tplroot ~ '.config.file' %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}

include:
  - {{ sls_config_file }}

mattermost-service-file-managed:
  file.managed:
    - name: {{ mattermost.service.file }}
    - user: root
    - group: root
    - mode: 664
    - source: {{ mattermost.service.source }}
    - context:
        mattermost: {{ mattermost | json }}
    - template: jinja

mattermost-service-running-service-reload:
{%- if grains.init == 'upstart' %}
  cmd.run:
    - name: initctl reload-configuration
    - onchanges:
      - file: mattermost-service-file-managed
{%- elif grains.init == 'systemd' %}
  cmd.run:
    - name: systemctl daemon-reload
    - onchanges:
      - file: mattermost-service-file-managed
{%- endif %}

mattermost-service-running-service-running:
  service.running:
    - name: {{ mattermost.service.name }}
    - enable: True
    - require:
      - sls: {{ sls_config_file }}
      - cmd: mattermost-service-running-service-reload
