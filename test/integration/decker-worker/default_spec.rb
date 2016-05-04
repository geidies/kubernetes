# Can reach master etcd service
describe host('192.168.33.10', port: 4001, proto: 'tcp') do
  it { should be_reachable }
end

# Can reach master API server
describe host('192.168.33.10', port: 8080, proto: 'tcp') do
  it { should be_reachable }
end
