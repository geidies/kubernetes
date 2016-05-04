# Etcd is listening on 4001
describe port(4001) do
  it { should be_listening }
end

# API Server is listening on 8080
describe port(8080) do
  it { should be_listening }
end

describe command('/opt/chef/embedded/bin/gem list -i -v 1.1.3 kubeclient') do
  its('exit_status') { should eq 0 }
end

# Make sure all nodes are available
describe command('/opt/chef/embedded/bin/ruby -e \'require "kubeclient"; c = Kubeclient::Client.new "http://localhost:8080/api/"; print c.get_nodes.length\'') do
  its('stdout') { should eq '3' }
end
