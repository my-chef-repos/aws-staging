# InSpec test for recipe node_setup::client_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

# environment = attribute('environment', description: 'The Chef Infra environment for the node')
chef_node = input('chef_node', description: 'Chef Node')

control 'client.rb 設定確認' do
  describe file('/etc/chef/client.rb') do
    its('content') { should match /chef_license "accept"/ }
    its('content') { should match /chef_server_url/ }
    its('content') { should match /policy_group "aws"/ }
    its('content') { should match /policy_name "web"/ }
    its('content') { should match /log_location STDOUT/ }
  end
end

control 'chef-client cron 確認' do
  if os.debian?
    describe service('cron') do
      it { should be_enabled }
      it { should be_running }
    end
  elsif os.redhat?
    describe service('crond') do
      it { should be_enabled }
      it { should be_running }
    end
  end
  describe file('/etc/cron.d/chef-client') do
    it { should exist }
    its('mode') { should cmp '0600' }
    its('owner') { should eq 'root' }
    its('group') { should eq 'root' }
    if chef_node['platform'] == 'raspbian' # RasPi は gem 使って chef-client を実行しているため gem の場所を指定。
      its('content') { should include '/root/.rbenv/shims/chef-client' }
    else # その他のOSはデフォルトのchef-clientコマンドパスを指定。
      its('content') { should include '/opt/chef/bin/chef-client' }
    end
    its('content') { should include '0,30 * * * *' }
  end
end
