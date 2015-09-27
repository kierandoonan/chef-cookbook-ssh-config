# If local_config and local_user are set, the cookbook will update the ssh
# config of the specified user instead of the global config
default[:ssh_config][:local_config] = false
default[:ssh_config][:local_user] = 'ubuntu'
# Location of local identity files
default[:ssh_config][:identityfile_dir] = '~/.ssh/keys'
