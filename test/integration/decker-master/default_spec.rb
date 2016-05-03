# Make sure all nodes are available
describe command('/opt/chef/embedded/bin/ruby -e \'require "kubeclient"; c = Kubeclient::Client.new "http://localhost:8080/api/"; print c.get_nodes.length\'') do
  its('stdout') { should eq '3' }
end
