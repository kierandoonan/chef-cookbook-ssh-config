#
# Cookbook Name:: ssh-config
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

if node[:ssh_config][:local_config]
  ssh_directory = "/home/#{node[:ssh_config][:local_user]}/.ssh"
  config_file = 'config'
else
  ssh_directory = '/etc/ssh'
  config_file = 'ssh_config'
end

directory ssh_directory do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

template "#{ssh_directory}/#{config_file}" do
  source 'config.erb'
  owner 'root'
  group 'root'
  mode '0744'
  variables({
    :hosts => search(:ssh_config).map{ |h| h['hosts'] }.flatten
  })
end
