#
# Cookbook:: postgresql_setup
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_profile 'postgresql_setup::validation_tests'

postgresql_server_install 'My PostgreSQL Server install' do
  action [ :install, :create ]
  version '12'
end

user 'r-goto'

postgresql_user 'r-goto' do
  superuser true
  createrole true
end

case node['platform']
when 'redhat' || 'centos'
  service 'postgresql-12' do
    action [ :start, :enable ]
  end
when 'ubuntu' || 'debian'
  service 'postgresql' do
    action [ :start, :enable ]
  end
end
