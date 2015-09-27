#
# Cookbook Name:: ssh-config
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template "#{node[:ssh_config][:config_file]}" do
  source 'config.erb'
  mode '0744'
  variables({
    :hosts => search(:ssh_config).map{ |h| h['hosts'] }.flatten
  })
end
