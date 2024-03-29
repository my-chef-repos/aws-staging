current_dir = File.dirname(__FILE__)
  user = 'r-goto'
  node_name                user
  client_key               "/home/ec2-user/r-goto.pem"
  chef_server_url          "https://chef-automate.creationline.com/organizations/aws-org"
  cookbook_path            ["#{current_dir}/../cookbooks"]
  cookbook_copyright       "First Org Cookbooks"
  cookbook_license         "Apache-2.0"
  cookbook_email           "cookbooks@aws.org"
  chef_license             'accept'
  ssl_verify_mode          :verify_none

  # Amazon AWS
  knife[:aws_access_key_id] = ENV['AWS_ACCESS_KEY_ID']
  knife[:aws_secret_access_key] = ENV['AWS_SECRET_ACCESS_KEY']
  knife[:region] = "ap-northeast-1"
