# Cookbook Name:: chef_nexus

default['chef_nexus']['nexus_tar_ball'] = 'nexus-3.15.2-01-unix.tar.gz'
default['chef_nexus']['nexus_download_url'] = 'http://download.sonatype.com/nexus/3/nexus-3.15.2-01-unix.tar.gz'
default['chef_nexus']['nexus_download_checksum'] = 'acde357f5bbc6100eb0d5a4c60a1673d5f1f785e71a36cfa308b8dfa45cf25d0'
default['chef_nexus']['nexus_dir'] = '/opt/nexus'
default['chef_nexus']['nexus_log_dir'] = '/var/log/nexus'
default['chef_nexus']['nexus_user'] = 'nexus'
default['chef_nexus']['nexus_group'] = 'nexus'
default['chef_nexus']['nexus_conf'] = '/opt/nexus/bin/nexus.vmoptions'
default['chef_nexus']['nexus_data_dir'] = '/opt/sonatype-work'
default['chef_nexus']['nexus_tmp_dir'] = '/opt/tmp'
default['chef_nexus']['java_package_version'] = '1.8.0.201.b09'
default['chef_nexus']['java_package_name'] = 'java-1.8.0-openjdk'