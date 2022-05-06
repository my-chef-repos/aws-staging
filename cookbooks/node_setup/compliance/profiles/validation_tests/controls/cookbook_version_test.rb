# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

chef_node = input('chef_node', description: 'Chef Node')
puts "\n##############################################\n\n\n 適用された Cookbook バージョン: v#{chef_node['cookbooks']}\n\n\n##############################################"