#
# Cookbook:: nginx_setup
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'nginx_setup::install-nginx'
include_profile 'nginx_setup::validation_tests'
