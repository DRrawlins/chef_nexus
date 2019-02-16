nexus_user = node['chef_nexus']['nexus_user']
nexus_group = node['chef_nexus']['nexus_group']

cookbook_file '/etc/systemd/system/nexus.service' do
  source 'nexus.service'
  owner nexus_user
  group nexus_group
  mode '0644'
  notifies :run, 'execute[systemctl daemon-reload]', :immediately
  action :create
end

directory '/var/log/nexus' do
  owner nexus_user
  group nexus_group
  mode '0640'
  recursive true
  action :create
end

file '/var/log/nexus/nexus.log' do
  owner nexus_user
  group nexus_group
  mode '0755'
  action :create
end

execute 'systemctl daemon-reload' do
  action :nothing
end

include_recipe 'chef_nexus::service_nexus'
