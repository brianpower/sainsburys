#!/bin/bash
export HOME=/root/
rm -Rf /etc/chef/Berksfile.lock
rm -Rf /var/chef/cache/cookbooks
rm -Rf /var/chef/chef-repo/cookbooks
cd /etc/chef
env HOME=/root /usr/local/bin/berks vendor /var/chef/chef-repo/cookbooks
