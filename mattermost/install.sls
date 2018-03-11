{% from "mattermost/map.jinja" import mattermost with context %}

{% set version = salt['pillar.get']('mattermost:global:version', mattermost.version) %}
{% set install_dir = salt['pillar.get']('mattermost:gloabl:install_dir', mattermost.install_dir) %}
mattermost_install:
  archive.extracted:
    - name: {{ install_dir }}
    - source: https://releases.mattermost.com/{{ version }}/mattermost-team-{{ version }}-linux-amd64.tar.gz
    - user: mattermost
    - group: mattermost
    - archive_format: tar
    - options: z
    - skip_verify: True
