# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- set sls_package_install = tplroot ~ '.package.install' %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}

include:
  - {{ sls_package_install }}

mattermost-config-file-serialize:
  file.serialize:
    - name: {{ mattermost.dir.configdir }}/config.json
    - dataset_pillar: 'mattermost'
    - formatter: json
    - serializer_opts:
      - indent: 4
    - user: {{ mattermost.user }}
    - group: {{ mattermost.group }}
    - mode: 644
    - show_changes: True
