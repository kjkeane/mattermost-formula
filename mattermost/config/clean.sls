# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_service_clean = tplroot ~ '.service.clean' %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}

include:
  - {{ sls_service_clean }}

mattermost-user-absent:
  user.absent:
    - name: mattermost
    - purge: True

mattermost-config-clean-file-absent:
  file.absent:
    - name: {{ mattermost.dir.configdir }}
    - require:
      - sls: {{ sls_service_clean }}