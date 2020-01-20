# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_config_clean = tplroot ~ '.config.clean' %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}
include:
  - {{ sls_config_clean }}

mattermost-package-clean-file-absent:
  file.absent:
    - name: {{ mattermost.dir.basedir }}
    - require:
      - sls: {{ sls_config_clean }}
