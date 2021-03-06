log_level :info
log_location STDOUT
local_mode true
chef_zero.enabled true
cookbook_path "/var/chef/chef-repo/cookbooks"
data_bag_path "/var/chef/chef-repo/data_bags"
file_cache_path "/var/chef/cache"
json_attribs "/etc/chef/node.json"
log_location "/var/log/chef-client.log"
