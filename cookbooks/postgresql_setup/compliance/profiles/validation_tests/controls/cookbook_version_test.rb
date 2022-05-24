# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

chef_node = input('chef_node', description: 'Chef Node')

if chef_node.match('Skipping test.')
  puts 'Comliance Phase 外の InSpec 実行では、ノードオブジェクトを取得できないため、Cookbook バージョン確認は、スキップ'
else
  puts "\n##############################################\n\n\n 適用された Cookbook バージョン: #{chef_node['cookbooks']}\n\n\n##############################################"
end
