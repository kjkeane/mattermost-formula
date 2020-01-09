# frozen_string_literal: true

control 'Mattermost configuration' do
  title 'should match desired lines'

  # main configuration
  describe file('/opt/mattermost/config/config.json') do
    it { should be_file }
    it { should be_owned_by 'mattermost' }
    it { should be_grouped_into 'mattermost' }
    its('mode') { should cmp '0644' }
    its('content') { should include %("SiteName": "Mattermost") }
  end
end
