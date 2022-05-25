#
# Cookbook:: ssh_setup
# Recipe:: setup_ssh_config
#
# Copyright:: 2021, The Authors, All Rights Reserved.

cookbook_file '/etc/ssh/sshd_config' do
  source 'insecure_sshd_config'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  notifies :restart, 'service[sshd]'
end

service 'sshd' do
  action :nothing
end
