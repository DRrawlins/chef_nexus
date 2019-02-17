nexus_user = node['chef_nexus']['nexus_user']
nexus_group = node['chef_nexus']['nexus_group']
n_log_dir_file = File.join(node['chef_nexus']['nexus_log_dir'], node['chef_nexus']['nexus_log_dir_file'])

cookbook_file node['chef_nexus']['nexus_service'] do
  source node['chef_nexus']['nexus_service_cb_file']
  owner nexus_user
  group nexus_group
  mode '0644'
  notifies :run, 'execute[systemctl daemon-reload]', :immediately
  action :create
end

directory node['chef_nexus']['nexus_log_dir'] do
  owner nexus_user
  group nexus_group
  mode '0640'
  recursive true
  action :create
end

file n_log_dir_file do
  owner nexus_user
  group nexus_group
  mode '0755'
  action :create
end

execute 'systemctl daemon-reload' do
  action :nothing
end

include_recipe 'chef_nexus::service_nexus'
