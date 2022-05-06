#
# Cookbook:: node_setup
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

###########
# Set Timezone
###########

timezone "Set TZ to #{node['node_setup']['timezone']}" do
  timezone "#{node['node_setup']['timezone']}"
end
