#
# Cookbook:: node_setup
# Recipe:: client_setup.rb
#
# Copyright:: 2021, The Authors, All Rights Reserved.

###########
# Setup client.rb with Chef Server access credentials
###########

chef_client_config 'client.rb' do
  chef_server_url "https://#{node['node_setup']['chef_server']['fqdn']}/organizations/#{node['node_setup']['org_name']}"
  chef_license 'accept'
  log_location 'STDOUT'
  policy_name "#{node['node_setup']['policy_name']}"
  policy_group "#{node['node_setup']['policy_group']}"
end

###########
# Control chef-client version with `chef_client_updater` cookbook 'https://github.com/chef-cookbooks/chef_client_updater'
###########

chef_client_updater "up or down grade Chef Infra version to #{node['node_setup']['client_updater']['version']}" do
  version "#{node['node_setup']['client_updater']['version']}"
  channel "#{node['node_setup']['client_updater']['channel']}"
  post_install_action 'exec'
end

###########
# Set up a cron job for chef-client to run every 30 mins
###########
chef_client_cron 'Run Chef Infra Client as a cron job' do
  accept_chef_license true
  minute "#{node['chef_client_cron']['minute']}"
  splay "#{node['chef_client_cron']['splay']}"
  chef_binary_path '/root/.rbenv/shims/chef-client' if platform?('raspbian') # RasPi は gem 使って chef-client を実行しているため gem の場所を指定する。
end
