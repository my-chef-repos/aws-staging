# InSpec test for recipe nginx_setup::install-nginx

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

if inspec.platform.name == 'ubuntu'
  describe package('nginx-common') do
    it { should be_installed }
  end
else
  describe package('nginx') do
    it { should be_installed }
  end
end

describe service('nginx') do
  it { should be_running }
  it { should be_enabled }
end

describe port(80) do
  it { should be_listening }
end

describe command('curl -s localhost') do
  its('stdout') { should match /Welcome/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end

describe file('/usr/share/nginx/html/chef-progress-logo.png') do
  it { should exist }
end
