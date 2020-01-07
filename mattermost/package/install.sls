# -*- coding: utf-8 -*-
# vim: ft=sls

{#- Get the `tplroot` from `tpldir` #}
{%- set tplroot = tpldir.split('/')[0] %}
{%- from tplroot ~ "/map.jinja" import mattermost with context %}

mattermost-user-present:
  user.present:
    - fullname: Mattermost Service User
    - name: mattermost
    - system: True
    - home: {{ mattermost.dir.basedir }}

mattermost_install:
  archive.extracted:
    - name: {{ mattermost.dir.installdir }}
    - source: https://releases.mattermost.com/{{ mattermost.pkg.version }}/mattermost-team-{{ mattermost.pkg.version }}-linux-amd64.tar.gz
    - user: mattermost
    - group: mattermost
    - archive_format: tar
    - options: z
    - skip_verify: True
