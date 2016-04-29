include_recipe 'kubernetes::install'

kube_node 'default-worker' do
  ip '192.168.33.12'
  master_ip node['kubernetes']['master']['ip']
end
