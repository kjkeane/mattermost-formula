# -*- coding: utf-8 -*-
# vim: ft=yaml
---
mattermost:
  pkg:
    name: mattermost
    version: '5.18.0'

  user: mattermost
  group: mattermost

  dir:
    installdir: /opt
    basedir: /opt/mattermost
    configdir: /opt/mattermost/config
    service: /etc/systemd/system

  service:
    name: mattermost
    file: '/etc/systemd/system/mattermost.service'
    source: salt://mattermost/files/default/systemd.jinja
    sql: postgresql-10

  # Required settings to start Mattermost
  ServiceSettings:
    SiteURL: ''
    WebsocketURL: ''
    LicenseFileLocation: ''
    ListenAddress: ":8065"
    ConnectionSecurity: ''
    TLSCertFile: "/path/to/cert"
    TLSKeyFile: "/path/to/key"
    TLSMinVer: '1.2'
    TLSStrictTransport: false
    TLSStrictTransportMaxAge: 63072000
    TLSOverwriteCiphers: []
    UseLetsEncrypt: false
    LetsEncryptCertificateCacheFile: "./config/letsencrypt.cache"
    Forward80To443: false
    TrustedProxyIPHeader: []
    ReadTimeout: 300
    WriteTimeout: 300
    MaximumLoginAttempts: 10
    GoroutineHealthThreshold: -1
    GoogleDeveloperKey: ''
    EnableOAuthServiceProvider: false
    EnableIncomingWebhooks: true
    EnableOutgoingWebhooks: true
    EnableCommands: true
    EnableOnlyAdminIntegrations: true
    EnablePostUsernameOverride: false
    EnablePostIconOverride: false
    EnableLinkPreviews: false
    EnableTesting: false
    EnableDeveloper: false
    EnableSecurityFixAlert: true
    EnableInsecureOutgoingConnections: false
    AllowedUntrustedInternalConnections: ''
    EnableMultifactorAuthentication: false
    EnforceMultifactorAuthentication: false
    EnableUserAccessTokens: false
    AllowCorsFrom: ''
    CorsExposedHeaders: ''
    CorsAllowCredentials: false
    CorsDebug: false
    AllowCookiesForSubdomains: false
    SessionLengthWebInDays: 30
    SessionLengthMobileInDays: 30
    SessionLengthSSOInDays: 30
    SessionCacheInMinutes: 10
    SessionIdleTimeoutInMinutes: 10
    WebsocketSecurePort: 443
    WebsocketPort: 80
    WebserverMode: gzip
    EnableCustomEmoji: false
    EnableEmojiPicker: true
    EnableGifPicker: false
    GfycatApiKey: 2_KtH_W5
    GfycatApiSecret: 3wLVZPiswc3DnaiaFoLkDvB4X0IV6CpMkj4tf2inJRsBY6-FnkT08zGmppWFgeof
    RestrictCustomEmojiCreation: all
    RestrictPostDelete: all
    AllowEditPost: always
    PostEditTimeLimit: -1
    TimeBetweenUserTypingUpdatesMilliseconds: 5000
    EnablePostSearch: true
    MinimumHashtagLength: 3
    EnableUserTypingMessages: true
    EnableChannelViewedMessages: true
    EnableUserStatuses: true
    ExperimentalEnableAuthenticationTransfer: true
    ClusterLogTimeoutMilliseconds: 2000
    CloseUnusedDirectMessages: false
    EnablePreviewFeatures: true
    EnableTutorial: true
    ExperimentalEnableDefaultChannelLeaveJoinMessages: true
    ExperimentalGroupUnreadChannels: disabled
    ExperimentalChannelOrganization: false
    ImageProxyType: ''
    ImageProxyURL: ''
    ImageProxyOptions: ''
    EnableAPITeamDeletion: false
    ExperimentalEnableHardenedMode: false
    DisableLegacyMFA: false
    ExperimentalStrictCSRFEnforcement: false
    EnableEmailInvitations: false
    DisableBotsWhenOwnerIsDeactivated: true
    EnableBotAccountCreation: false
    EnableSVGs: false
    EnableLatex: false
  TeamSettings:
    SiteName: Mattermost
    MaxUsersPerTeam: 50
    EnableTeamCreation: true
    EnableUserCreation: true
    EnableOpenServer: false
    EnableUserDeactivation: false
    RestrictCreationToDomains: ''
    EnableCustomBrand: false
    CustomBrandText: ''
    CustomDescriptionText: ''
    RestrictDirectMessage: any
    RestrictTeamInvite: all
    RestrictPublicChannelManagement: all
    RestrictPrivateChannelManagement: all
    RestrictPublicChannelCreation: all
    RestrictPrivateChannelCreation: all
    RestrictPublicChannelDeletion: all
    RestrictPrivateChannelDeletion: all
    RestrictPrivateChannelManageMembers: all
    EnableXToLeaveChannelsFromLHS: false
    UserStatusAwayTimeout: 300
    MaxChannelsPerTeam: 2000
    MaxNotificationsPerChannel: 1000
    EnableConfirmNotificationsToChannel: true
    TeammateNameDisplay: username
    ExperimentalViewArchivedChannels: false
    ExperimentalEnableAutomaticReplies: false
    ExperimentalHideTownSquareinLHS: false
    ExperimentalTownSquareIsReadOnly: false
    LockTeammateNameDisplay: false
    ExperimentalPrimaryTeam: ''
    ExperimentalDefaultChannels: []
  ClientRequirements:
    AndroidLatestVersion: ''
    AndroidMinVersion: ''
    DesktopLatestVersion: ''
    DesktopMinVersion: ''
    IosLatestVersion: ''
    IosMinVersion: ''
  SqlSettings:
    DriverName: mysql
    # yamllint disable-line rule:line-length
    DataSource: mmuser:mostest@tcp(localhost:3306)/mattermost_test?charset=utf8mb4,utf8\u0026readTimeout=30s\u0026writeTimeout=30s
    DataSourceReplicas: []
    DataSourceSearchReplicas: []
    MaxIdleConns: 20
    ConnMaxLifetimeMilliseconds: 3600000
    MaxOpenConns: 300
    Trace: false
    AtRestEncryptKey: ''
    QueryTimeout: 30
  LogSettings:
    EnableConsole: true
    ConsoleLevel: INFO
    ConsoleJson: true
    EnableFile: true
    FileLevel: INFO
    FileJson: true
    FileLocation: ''
    EnableWebhookDebugging: true
    EnableDiagnostics: true
  NotificationLogSettings:
    EnableConsole: true
    ConsoleLevel: DEBUG
    ConsoleJson: true
    EnableFile: true
    FileLevel: INFO
    FileJson: true
    FileLocation: ''
  PasswordSettings:
    MinimumLength: 5
    Lowercase: false
    Number: true
    Uppercase: false
    Symbol: false
  FileSettings:
    EnableFileAttachments: true
    EnableMobileUpload: true
    EnableMobileDownload: true
    MaxFileSize: 52428800
    DriverName: local
    Directory: "./data/"
    EnablePublicLink: false
    PublicLinkSalt: ''
    InitialFont: nunito-bold.ttf
    AmazonS3AccessKeyId: ''
    AmazonS3SecretAccessKey: ''
    AmazonS3Bucket: ''
    AmazonS3Region: ''
    AmazonS3Endpoint: s3.amazonaws.com
    AmazonS3SSL: true
    AmazonS3SignV2: false
    AmazonS3SSE: false
    AmazonS3Trace: false
  EmailSettings:
    EnableSignUpWithEmail: true
    EnableSignInWithEmail: true
    EnableSignInWithUsername: true
    SendEmailNotifications: true
    UseChannelInEmailNotifications: false
    RequireEmailVerification: false
    FeedbackName: ''
    FeedbackEmail: test@example.com
    ReplyToAddress: test@example.com
    FeedbackOrganization: ''
    EnableSMTPAuth: false
    SMTPUsername: ''
    SMTPPassword: ''
    SMTPServer: localhost
    SMTPPort: '10025'
    ConnectionSecurity: ''
    SendPushNotifications: true
    PushNotificationServer: https://push-test.mattermost.com
    PushNotificationContents: generic
    EnableEmailBatching: false
    EmailBatchingBufferSize: 256
    EmailBatchingInterval: 30
    EnablePreviewModeBanner: true
    SkipServerCertificateVerification: false
    EmailNotificationContentsType: full
    LoginButtonColor: "#0000"
    LoginButtonBorderColor: "#2389D7"
    LoginButtonTextColor: "#2389D7"
  RateLimitSettings:
    Enable: false
    PerSec: 10
    MaxBurst: 100
    MemoryStoreSize: 10000
    VaryByRemoteAddr: true
    VaryByUser: false
    VaryByHeader: ''
  PrivacySettings:
    ShowEmailAddress: true
    ShowFullName: true
  SupportSettings:
    TermsOfServiceLink: https://about.mattermost.com/default-terms/
    PrivacyPolicyLink: https://about.mattermost.com/default-privacy-policy/
    AboutLink: https://about.mattermost.com/default-about/
    HelpLink: https://about.mattermost.com/default-help/
    ReportAProblemLink: https://about.mattermost.com/default-report-a-problem/
    SupportEmail: feedback@mattermost.com
    CustomTermsOfServiceEnabled: false
    CustomTermsOfServiceReAcceptancePeriod: 365
  AnnouncementSettings:
    EnableBanner: false
    BannerText: ''
    BannerColor: "#f2a93b"
    BannerTextColor: "#333333"
    AllowBannerDismissal: true
  ThemeSettings:
    EnableThemeSelection: true
    DefaultTheme: default
    AllowCustomThemes: true
    AllowedThemes: []
  GitLabSettings:
    Enable: false
    Secret: ''
    Id: ''
    Scope: ''
    AuthEndpoint: ''
    TokenEndpoint: ''
    UserApiEndpoint: ''
  GoogleSettings:
    Enable: false
    Secret: ''
    Id: ''
    Scope: profile email
    AuthEndpoint: https://accounts.google.com/o/oauth2/v2/auth
    TokenEndpoint: https://www.googleapis.com/oauth2/v4/token
    # yamllint disable-line rule:line-length
    UserApiEndpoint: https://people.googleapis.com/v1/people/me?personFields=names,emailAddresses,nicknames,metadata
  Office365Settings:
    Enable: false
    Secret: ''
    Id: ''
    Scope: User.Read
    AuthEndpoint: https://login.microsoftonline.com/common/oauth2/v2.0/authorize
    TokenEndpoint: https://login.microsoftonline.com/common/oauth2/v2.0/token
    UserApiEndpoint: https://graph.microsoft.com/v1.0/me
  LdapSettings:
    Enable: false
    EnableSync: false
    LdapServer: ''
    LdapPort: 389
    ConnectionSecurity: ''
    BaseDN: ''
    BindUsername: ''
    BindPassword: ''
    UserFilter: ''
    GroupFilter: ''
    GuestFilter: ''
    GroupDisplayNameAttribute: ''
    GroupIdAttribute: ''
    FirstNameAttribute: ''
    LastNameAttribute: ''
    EmailAttribute: ''
    UsernameAttribute: ''
    NicknameAttribute: ''
    IdAttribute: ''
    PositionAttribute: ''
    LoginIdAttribute: ''
    SyncIntervalMinutes: 60
    SkipCertificateVerification: false
    QueryTimeout: 60
    MaxPageSize: 0
    LoginFieldName: ''
    LoginButtonColor: "#0000"
    LoginButtonBorderColor: "#2389D7"
    LoginButtonTextColor: "#2389D7"
    Trace: false
  ComplianceSettings:
    Enable: false
    Directory: "./data/"
    EnableDaily: false
  LocalizationSettings:
    DefaultServerLocale: en
    DefaultClientLocale: en
    AvailableLocales: ''
  SamlSettings:
    Enable: false
    EnableSyncWithLdap: false
    EnableSyncWithLdapIncludeAuth: false
    Verify: true
    Encrypt: true
    SignRequest: false
    IdpUrl: ''
    IdpDescriptorUrl: ''
    AssertionConsumerServiceURL: ''
    SignatureAlgorithm: RSAwithSHA1
    CanonicalAlgorithm: Canonical1.0
    ScopingIDPProviderId: ''
    ScopingIDPName: ''
    IdpCertificateFile: ''
    PublicCertificateFile: ''
    PrivateKeyFile: ''
    IdAttribute: ''
    GuestAttribute: ''
    FirstNameAttribute: ''
    LastNameAttribute: ''
    EmailAttribute: ''
    UsernameAttribute: ''
    NicknameAttribute: ''
    LocaleAttribute: ''
    PositionAttribute: ''
    LoginButtonText: SAML
    LoginButtonColor: "#34a28b"
    LoginButtonBorderColor: "#2389D7"
    LoginButtonTextColor: "#ffffff"
  NativeAppSettings:
    AppDownloadLink: https://mattermost.com/download/#mattermostApps
    AndroidAppDownloadLink: https://about.mattermost.com/mattermost-android-app/
    IosAppDownloadLink: https://about.mattermost.com/mattermost-ios-app/
  ClusterSettings:
    Enable: false
    ClusterName: ''
    OverrideHostname: ''
    NetworkInterface: ''
    BindAddress: ''
    AdvertiseAddress: ''
    UseIpAddress: true
    UseExperimentalGossip: false
    ReadOnlyConfig: true
    GossipPort: 8074
    StreamingPort: 8075
    MaxIdleConns: 100
    MaxIdleConnsPerHost: 128
    IdleConnTimeoutMilliseconds: 90000
  MetricsSettings:
    Enable: false
    BlockProfileRate: 0
    ListenAddress: ":8067"
  ExperimentalSettings:
    ClientSideCertEnable: false
    ClientSideCertCheck: secondary
    EnableClickToReply: false
    LinkMetadataTimeoutMilliseconds: 5000
    RestrictSystemAdmin: false
  AnalyticsSettings:
    MaxUsersForStatistics: 2500
  ElasticsearchSettings:
    ConnectionUrl: http://localhost:9200
    Username: elastic
    Password: changeme
    EnableIndexing: false
    EnableSearching: false
    EnableAutocomplete: false
    Sniff: true
    PostIndexReplicas: 1
    PostIndexShards: 1
    ChannelIndexReplicas: 1
    ChannelIndexShards: 1
    UserIndexReplicas: 1
    UserIndexShards: 1
    AggregatePostsAfterDays: 365
    PostsAggregatorJobStartTime: '03:00'
    IndexPrefix: ''
    LiveIndexingBatchSize: 1
    BulkIndexingTimeWindowSeconds: 3600
    RequestTimeoutSeconds: 30
    SkipTLSVerification: false
    Trace: ''
  DataRetentionSettings:
    EnableMessageDeletion: false
    EnableFileDeletion: false
    MessageRetentionDays: 365
    FileRetentionDays: 365
    DeletionJobStartTime: '02:00'
  MessageExportSettings:
    EnableExport: false
    ExportFormat: actiance
    DailyRunTime: '01:00'
    ExportFromTimestamp: 0
    BatchSize: 10000
    GlobalRelaySettings:
      CustomerType: A9
      SmtpUsername: ''
      SmtpPassword: ''
      EmailAddress: ''
  JobSettings:
    RunJobs: true
    RunScheduler: true
  PluginSettings:
    Enable: true
    EnableUploads: false
    AllowInsecureDownloadUrl: false
    EnableHealthCheck: true
    Directory: "./plugins"
    ClientDirectory: "./client/plugins"
    Plugins: {}
    PluginStates:
      com.mattermost.nps:
        Enable: true
    EnableMarketplace: true
    RequirePluginSignature: false
    MarketplaceUrl: https://api.integrations.mattermost.com
    SignaturePublicKeyFiles: []
  DisplaySettings:
    CustomUrlSchemes: []
    ExperimentalTimezone: false
  GuestAccountsSettings:
    Enable: false
    AllowEmailAccounts: true
    EnforceMultifactorAuthentication: false
    RestrictCreationToDomains: ''
  ImageProxySettings:
    Enable: false
    ImageProxyType: local
    RemoteImageProxyURL: ''
    RemoteImageProxyOptions: ''
