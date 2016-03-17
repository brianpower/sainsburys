# Sainsburys

This solution uses Terraform to build the instances on AWS, followed by configuration using Chef and
finally some additional scripts and config to finalise the builds

## Terraform
Using version 0.5.3, this version is the last known version which allows for the sucsessful remote-exec function.
Built on a separate instance (52.49.136.63), the ec2-user is used to run the builds vis~/Terraform/Builds/web and app directories.
3 configuration files were used, main.tf, variables.tf and terraform.tfvars. The latter is not uploaded into git as it holds the access keys.

### main.tf
The is the main configuration file and is broken down into sections:
  provider:   In this instance is aws and includes the access and region specifics
  resource:   Set to aws instance (ec2) and requires the connection parameters, instance type, ami to use, ssh key, subnet and
              security groups to use. Additional I have set some tags for ease of identification and the lifecycle option.
  provisioner:  Enables a remote execution of instructions, this is divided into:
      Bringing config files across form github
      Placing Chef config files into place and running it
      Setting specific applications, nginx for web server and go for the app servers

## Chef
Using the latest version 12.8.1, Chef comprises of files located in /etc/chef. Of these, 2 are most likely to change and can differ from build to build, these are:
### Berksfile
This file enables the cookbooks to be sourced, most commonly from the Supermarket or from a locally maintained
git repo. The latter allows for increased control of versions and customised recipes.
### node.json
This file is responsible for the applications that are to be installed, it reflects the recipes present in
the cookbooks and can comprise of customised attributes.
              
## GIT
The git repository is my personal one which has a Sainburys repo set up in the public space.
It comprises of the specific configuration files mentioned above.

## Build
To build a new node, ssh into the build server using user ec2-user and the private key bp.pem (This will be removed after a few days for obvious reasons :)
  eg: ssh -i ~/.ssh/bp.pem ec2-user@52.49.136.63
  
  $ cd Terraform/Builds
  There are now 2 further sub directories, app and web, select which one you wish to build, then run
  $ terraform apply web.plan      - for example
  Terraform will now build that single instance and show progress.
  
## Additional
For ease I have added the 2 app server ips into the web servers /etc/hosts file, it is assumed in production the nginx config
files will contain dns names of the app servers.
  

