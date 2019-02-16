nexus_user = node['chef_nexus']['nexus_user']
nexus_group = node['chef_nexus']['nexus_group']

user nexus_user do
  system true
  comment 'sonatype nexus'
  shell '/bin/false'
  action:create
end

group nexus_group do
  system true
  action:create
  members nexus_user
end

dnf_package 'chef_java' do
  package_name               node['chef_nexus']['java_package_name']
  version                    node['chef_nexus']['java_package_version']
  action                     :install
end

include_recipe 'chef_nexus::install_binary_nexus'
