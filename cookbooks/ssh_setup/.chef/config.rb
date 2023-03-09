# This config file and .chef directory would be transferred to 
# Github Runner and be used on the Runner. (The Runner is the Chef Workstation)
# Github repo must have AWS credentials and Github Runner must have the "client_key"

current_dir = File.dirname(__FILE__)
  user = 'r-goto'
  node_name                user
  client_key               "/home/ec2-user/r-goto.pem"
  chef_server_url          "https://chef-automate.creationline.com/organizations/aws-org"
  cookbook_path            ["#{current_dir}/../cookbooks"]
  cookbook_copyright       "AWS Org Cookbooks"
  cookbook_license         "Apache-2.0"
  cookbook_email           "cookbooks@first.org"
  chef_license             'accept'

  # Amazon AWS
  knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
  knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
