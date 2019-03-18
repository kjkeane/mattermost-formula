==========
mattermost
==========
Install, configure, and run `mattermost`

Available states
===================

.. contents::
  :local:

Use the supplied config.json for a flat file approach,
or the jinja template and pillar for a salt approach.

``mattermost``
--------------

Install, configure, and run ``mattermost`` service.

``mattermost.install``
----------------------

Install ``mattermost``

``mattermost.config``
---------------------

Manage the configuration of ``mattermost``.
(Setting information can be found `here <https://docs.mattermost.com/administration/config-settings.html#general>`_)

``mattermost.service``
----------------------

Make sure ``mattermost`` service running

