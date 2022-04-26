# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

name 'db'
default_source :chef_server, 'https://chef-automate.creationline.com/organizations/aws-org'
# run_list 'node_setup::default', 'postgresql_setup::default'
run_list 'postgresql_setup::default'
cookbook 'node_setup', '1.0.0'
cookbook 'postgresql_setup', '1.0.0'


##########
# Attributes
##########

# Specify Policy name & Policy group
override['node_setup']['policy_name'] = 'db'
override['node_setup']['policy_group'] = 'aws'

# Specify chef-client version
override['node_setup']['chef_client']['version'] = '17.9.52'
override['node_setup']['chef_client']['channel'] = 'stable'

# Specify node Time Zone
override['node_setup']['timezone'] = 'Asia/Tokyo'
