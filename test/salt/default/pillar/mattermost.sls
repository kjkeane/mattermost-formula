# -*- coding: utf-8 -*-
# vim: ft=yaml
---
# Simple pillar setup

mattermost:
  TeamSettings:
    SiteName: 'Mattermost'
  SqlSettings:
    DriverName: mysql
    DataSource: 'mmuser:mostest@tcp(localhost:3306)/mattermost_test?charset=utf8mb4,utf8&readTimeout=30s&writeTimeout=30s'
