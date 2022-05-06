#
# Cookbook:: node_setup
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'node_setup::client_setup'
include_recipe 'node_setup::timezone_setup'
include_profile 'node_setup::*'
include_input 'node_setup::*'
