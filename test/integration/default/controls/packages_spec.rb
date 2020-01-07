# frozen_string_literal: true

control 'Mattermost package' do
  title 'should be installed'

  describe package('mattermost') do
    it { should be_installed }
  end
end