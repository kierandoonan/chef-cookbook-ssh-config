require 'serverspec'

# Required by serverspec
set :backend, :exec

describe file('/etc/ssh/ssh_config') do 
  its(:content) { should match /Host kitchen-test-1/ }
  its(:content) { should match /identityfile ~\/\.ssh\/keys\/kitchen-test\.pem/ }
  its(:content) { should match /hostname 8\.8\.8\.8/ }
  its(:content) { should match /port 22/ }

  its(:content) { should match /Host kitchen-test-2/ }
  its(:content) { should match /identityfile ~\/\.ssh\/keys\/kitchen-test-2\.pem/ }
  its(:content) { should match /hostname 8\.8\.8\.9/ }
  its(:content) { should match /port 2222/ }
end

