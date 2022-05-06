# InSpec test for recipe node_setup::timezone_setup.rb

# The InSpec reference, with examples and extensive documentation, can be
# found at https://docs.chef.io/inspec/resources/

title 'タイムゾーン確認'

describe bash('timedatectl status | grep Tokyo') do
  its('stdout') { should include 'Time zone: Asia/Tokyo' }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end
