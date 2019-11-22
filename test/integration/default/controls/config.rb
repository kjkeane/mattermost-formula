# Set defaults, use debian as base

mattermost_directory = '/opt/mattermost/'

control 'Mattermost configuration' do
  title 'should match desired lines'

  # main configuration
  describe file('/opt/mattermost/config/config.json') do
    it { should be_file }
    it { should be_owned_by 'mattermost' }
    it { should be_grouped_into 'root' }
    its('mode') { should cmp '0644' }
    its('content') { should include %Q[        "SiteName": "Mattermost"] }
  end
end
