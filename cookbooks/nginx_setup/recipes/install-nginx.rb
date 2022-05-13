#
# Cookbook:: nginx_setup
# Recipe:: install-nginx
#
# Copyright:: 2021, The Authors, All Rights Reserved.

case node['platform']
when 'centos', 'amazon', 'almalinux'
  nginx_install 'nginx' do
    source 'epel'
  end
when 'ubuntu'
  nginx_install 'nginx' do
    source 'distro'
  end
when 'redhat'
  package 'nginx'
  service 'nginx' do
    action [ :start, :enable]
  end
end

nginx_service 'nginx' do
  action :enable
  delayed_action :start
end

nginx_config 'nginx' do
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
  default_site_template 'default-site.erb'
end

nginx_site 'default-site' do
  mode '0644'
  variables(
    'server' => {
      'charset' => [ 'shift-jis' ],
      'listen' => [ '*:80' ],
      'server_name' => [ 'test_site' ],
      'access_log' => '/var/log/nginx/test_site.access.log',
      'locations' => {
        '/' => {
          'root' => '/usr/share/nginx/html',
          'index' => "#{node['nginx_setup']['root_index']} index.html",
        },
      },
    }
  )
  action :create
  notifies :reload, 'nginx_service[nginx]', :delayed
end

template 'Create another root page' do
  source "#{node['nginx_setup']['root_index']}.erb"
  mode '0755'
  owner 'root'
  path "/usr/share/nginx/html/#{node['nginx_setup']['root_index']}"
end

cookbook_file '/usr/share/nginx/html/chef-progress-logo.png' do
  source 'chef-progress-logo.png'
  owner 'root'
  group 'root'
  mode '0777'
  action :create
end
