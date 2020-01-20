# frozen_string_literal: true

control 'Mattermost package' do
  title 'should be installed'

  describe directory('/opt/mattermost') do
    its('mode') { should cmp '0755' }
  end
end
