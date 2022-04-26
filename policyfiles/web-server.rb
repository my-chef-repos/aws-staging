# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

name 'web'
default_source :chef_server, 'https://chef-automate.creationline.com/organizations/aws-org'
run_list 'node_setup::default', 'nginx_setup::default'
cookbook 'node_setup', '1.0.0'
cookbook 'nginx_setup', '1.0.0'

##########
# Attributes
##########

# Specify node Time Zone
override['node_setup']['timezone'] = 'Asia/Tokyo'

# Specify Policy name & Policy group
override['node_setup']['policy_name'] = 'web'
override['node_setup']['policy_group'] = 'aws'

# Specify chef-client version
override['node_setup']['chef_client']['version'] = '17.9.52'
override['node_setup']['chef_client']['channel'] = 'stable'

# Invoke the Compliance Phase
override['audit']['compliance_phase']

# Set profile location
default['audit']['profiles']['ssh-baseline'] = {
  'compliance': 'admin/ssh-baseline',
  'version': '1.0.0'
}
default['audit']['profiles']['nginx-baseline'] = {
  'compliance': 'admin/nginx-baseline',
  'version': '1.0.0'
}

# Set Fetcher&Reporter
default['audit']['fetcher'] = 'chef-server'
default['audit']['reporter'] = 'chef-server-automate'
