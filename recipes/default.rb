# Cookbook Name:: chef_nexus
# Recipe:: default

include_recipe 'chef_nexus::install_nexus'
include_recipe 'chef_nexus::nexus_config'
include_recipe 'chef_nexus::install_service_nexus'
