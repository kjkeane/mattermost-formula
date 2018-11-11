==========
mattermost
==========
Install, configure, and run `mattermost`.

**NOTE:** This is currently a work in progress, this will work on RHEL/CentOS 7 and Ubuntu/Debian 16.04/9 machines, The pillar file suports all settings within Mattermost 5.4.0.

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

Currently, a majority of options can be set using the pillar, but here are few important settings:
(More settings can be found `here <https://docs.mattermost.com/administration/config-settings.html#general>`_)

- ServiceSettings

  + siteurl: URL that users will use to access Mattermost
  + listen-address: Address and port to which to bind and listen. Specifying ":8065" will bind to all network interfaces
  + forward-to-https: Forwards all insecure traffic from port 80 to secure port 443
  + connection-security: Set the following options: None, TLS, STARTTLS
  + tls-cert-file: Path of the certificate file to use for TLS connection security
  + tls-key-file: Path of the TLS key file to use for TLS connection security
  + letsencrypt: Enable automatic retrieval of certificates from Let's Encrypt
  and many more

- TeamSettings

  + site-name: Name of service show in login screens and UI. Maximum 30 characters
  + max-users: Maximum number of users per team, excluding inactive users
  + team-creation: Ability to create a new team is enable for all users
  + user-creation: Ability to create new accounts is eanble via inviting new members or sharing the team invite link
  + user-away-timeout: The number of seconds after which the user's status indicator changs to "Away", when they are away from Mattermost
  + teammate-name-display: Specifies how names are displayed in the user interface
  and many more

- DisplaySettings

  + experimental-timezone: Timezone settings is visible in Account Settings and a time zone is automatically assigned in the next active session

- SqlSettings

  + drivername: (mysql, postgres) Enables the database driver
  + datasource: Connection string to the master database, varies based on drivername
  + max-idle-connections: Maximum number of idle connections held open to the database
  + max-open-connections: Maximum number of open connections held open to the database
  and many more

- LogSettings

  + enable-console: Output log messages to the console based on ConsoleLevl option
  + console-level: Level of detail at which log events are written to the console
  + enable-file: Log files are written to files specified in FileLocation
  + file-location: Location of the log files, if left blank they are stored in the './logs' directory
  + file-level: Level of detail at which log events are written to log files
  and many more

- PasswordSettings

  + minimum-length: Minimum number of characters required for a valid password
  + lowercase: If a valid password must contain at least one lowercase letter
  + uppercase: If a valid password must contain at least one uppercase letter
  + number: If a valid password must contain at least one number
  + symbol: If a valid password must contain at least one symbol

- FileSettings

  + enable-attachments: Allow file and image uploads on messages
  + enable-mobile-upload: Allow file uploads on mobile apps
  + enable-mobile-download: Allow file downloads on mobile apps
  + amazons3-bucket: Name of the bucket for your S3 compatible object storage instance
  + amazons3-region: AWS region you selected when creating your S3 bucket
  and many more

- EmailSettings

  + enable-signup-with-email: Allow team creation and account signup using email and password
  + enable-singin-with-email: Allow account sign in with email and password
  + smtp-server: Location of SMTP email server
  + smtp-port: Port of SMTP email server
  + enable-email-batching: Users can select how often to receive email notifications
  and many more

- RateLimitSettings

  + enable: APIs are throttled
  + persec: Throttle API at this number of requests per second if rate limiting is enabled
  + max-burst: Maximum number of requests allowed beyond the per second query limit
  and many more

- PrivacySettings

  + show-email: Show email address of all users
  + show-name: Show full name of all users

- SupportSettings

  + tos-link: Configurable Terms of Service link
  + privacy-link: Configurable Privacy Policy link
  + about-link: Configurable About link
  and many more

- AnnouncementSettings

  + enable-banner: Enable announcement banner
  + banner-text: Text of the announcement banner
  and many more

- ThemeSettings

  + enable-theme-selection: Enable theme tab in Account Settings so users can select their theme
  + default-theme: Set a default theme that applies to all new users
  + allow-custom-themes: Enable custom theme selection in Account Settings for users
  + allowed-themes: Select themes that can be chosen by users

- GitLabSettings:

  + Enable: Enable GitLab settings
  + Scope: Standard setting for OAuth to determine scope of information shared with OAuth client
  + auth-endpoint: Enter 'https://<your-gitlab-url>/oauth/authorize'. Use HTTP or HTTPS depending on how your server is configured
  and many more

- Office365Settings

  + enable: Enable Office365 settings
  + auth-endpoint: Recommended to use 'https://accounts.google.com/o/oauth2/v2/auth as the Auth Endpoint. Otherwise, enter a custom endpoint
  + token-endpoint: Recommended to use 'https://login.microsoftonline.com/common/oauth2/v2.0/token as the Token Endpoint. Otherwise, use a custom endpoint
  and many more

- LdapSettings

  + enable: Enable LDAP settings
  + ldap-server: Location of LDAP server
  + ldap-port: Port of LDAP server
  + BaseDN: Base Distinguished Name of the location where Mattermost should start its search for users in the AD/LDAP tree
  + user-filter: Enter an AD/LDAP filter to use when searching for user objects
  and many more

- ComplianceSettings

  + enable: Enable Compliance settings
  and more

- LocalizationSettings:

  + default-server-locale: Default language for system messages and logs
  + default-client-locale: Default language for newly created users and pages
  + available-locale: Sets which languages are available for users

- SamlSettings

  + enable: Enable SAML settings
  + encrypt: Mattermost will decrypt SAML Assertions encrypted with your Service Provider Public Certificate
  + idp-url: URL where Mattermost sends a SAML request to start login sequence
  + idp-descriptor-url: Issuer URL for the Identity Provider you use for SAML requests
  and many more

- NativeAppSettings

  + app-download-link: Configurable link to a download page for Mattermost Apps
  + android-download-link: Configurable link to download the Android app
  + ios-download-link: Configurable link to down the iOS app

- ClusterSettings

  + enable: Enable Cluster settings
  + name: Cluster to join by name
  + override-hostname: Override hostname of this server, if blank Mattermost attempts to get the Hostname from the OS or use the IP address
  + read-only-config: Changes made to the settings in the System Console are ignored
  and many more

- MetricsSettings

  enable: Enable Metric settings
  block-profile-rate: Value control the fraction of goroutine blocking events reported in blocking profile
  listen-address: Address the Mattermost server will listen on to expose performance metrics

- AnalyticsSettings

  + max-users: Maximum number of users on the server before statistics for total posts

- WebrtcSettings

  + enable: Enable WebRTC settings
  + gateway-websocket-url: Websocket used to signal and establish communication between the peers
  + gateway-admin-url: Mattermost WebRTC uses this URL to obtain valid token for each peer to establish the connection
  and many more

- ElasticsearchSettings

  + connection-url: Address of the Elasticsearch server
  + username: Username to authenticate to the Elasticsearch server
  + password; Password to authenticate to the Elasticsearch server
  and many more

- DataRetentionSettings

  + enable-message-deletion: Enable how long messages kept in channels and direct messages
  + message-retention: Number of days Mattermost keeps messages in channels in direct messages
  + file-retention: Number of days Mattermost keeps files in channels and direct messages
  and many more

- JobSettings

  + run-jobs: Set whether or not this Mattermost server will handle tasks created by the Scheduler
  + run-scheduler: Set whether or not this Mattermost server will schedule tasks that will be completed by a Worker

- PluginSettings

  + enable: Enable plugins on your Mattermost server
  + enable-uploads: Enable the ability to upload plugins to Mattermost
  + Directory: Directory where plugins are installed/stored

``mattermost.service``
----------------------

Make sure ``mattermost`` service running

