# `node_setup` Cookbook

 Having issues with `knife bootstrap`? Prep already chef-client set up images/templates to spin up your node.
 Then use this cookbook to modify chef versions and etc to meet your needs. 
		
# Attributes		
		
 ```		
###
# These attributes are to be override after bootstrap via env/policy_group accordingly.
###

# Specify Chef Server FQDN & IP
default['node_setup']['chef_server']['ipaddress'] = '198.18.246.201'
default['node_setup']['chef_server']['fqdn'] = 'automate.cl'

# Specify Org name and its key file name
default['node_setup']['org_name'] = 'aws-org'
default['node_setup']['org_validation_key_file'] = 'validation.pem'

# Specify Policy name & Policy group OR Environment
default['node_setup']['policy_name'] = 'web-server'
default['node_setup']['policy_group'] = 'staging'
# default['node_setup']['environment'] = 'staging' # If Role&Environment is in use, `run_list` needs be set with `knife node run_list add NODE_NAME RUN_LIST_ITEM (options)`

# Specify chef-client version
default['node_setup']['client_updater']['version'] = '16'

# Specify node Time Zone
default['node_setup']['timezone'] = 'Asia/Tokyo'		
 ```
