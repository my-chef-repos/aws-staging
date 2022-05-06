###
# These attributes are to be adjusted in the policy group accordingly.
###

# Specify Chef Server FQDN & IP
default['node_setup']['chef_server']['fqdn'] = 'chef-automate.creationline.com'

# Specify Org name and its key file name
default['node_setup']['org_name'] = 'aws-org'
default['node_setup']['org_validator_name'] = 'aws-org-validator'

# Specify Policy name & Policy group OR Environment
default['node_setup']['policy_name'] = 'web'
default['node_setup']['policy_group'] = 'aws'

# Specify chef-client version
default['node_setup']['client_updater']['version'] = '17.9.52'
default['node_setup']['client_updater']['channel'] = 'stable'

# Specify chef-client cron interval settings
default['chef_client_cron']['minute'] = '0,30'
default['chef_client_cron']['splay'] = 300
