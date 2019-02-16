nexus_user = node['chef_nexus']['nexus_user']
nexus_group = node['chef_nexus']['nexus_group']

template 'nexus_conf' do
  source 'nexus.vmoptions.erb'
  owner nexus_user
  group nexus_group
  mode      '0644'
  path      node['chef_nexus']['nexus_conf']
  action    :create
end
