tar_ball = File.join(node['chef_nexus']['nexus_tmp_dir'], node['chef_nexus']['nexus_tar_ball'])
nexus_user = node['chef_nexus']['nexus_user']
nexus_group = node['chef_nexus']['nexus_group']
nexus_untar = File.basename tar_ball.to_s, '-unix.tar.gz'
nexus_dir = node['chef_nexus']['nexus_dir']
sonatype_dir = node['chef_nexus']['nexus_data_dir']
tmp_dir = node['chef_nexus']['nexus_tmp_dir']

directory 'nexus_dir_tmp' do
  path tmp_dir
  owner nexus_user
  group nexus_group
  recursive true
  action :create
  notifies :create, 'remote_file[tar_ball]', :immediately
end

remote_file 'tar_ball' do
  source node['chef_nexus']['nexus_download_url']
  owner nexus_user
  group nexus_group
  notifies :run, 'execute[untar nexus]', :immediately
  checksum node['chef_nexus']['nexus_download_checksum']
  path tar_ball
  action :nothing
end

execute 'untar nexus' do
  cwd tmp_dir
  command "tar xzf #{tar_ball}"
  user nexus_user
  group nexus_user
  notifies :create, 'directory[nexus_dir]', :immediately
  action :nothing
end

directory 'nexus_dir' do
  path nexus_dir
  owner nexus_user
  group nexus_group
  recursive true
  action :create
  notifies :run, 'execute[chown nexus_dir]', :immediately
end

execute 'chown nexus_dir' do
  command "chown -R #{nexus_user}:#{nexus_group} #{node['chef_nexus']['nexus_dir']}'/'"
  notifies :run, 'execute[mv nexus]', :immediately
  action :nothing
end

execute 'mv nexus' do
  cwd tmp_dir
  command "mv -fuT #{tmp_dir}'/'#{nexus_untar} #{node['chef_nexus']['nexus_dir']}"
  notifies :create, 'directory[sonatype_dir]', :immediately
  action :nothing
end

directory 'sonatype_dir' do
  path sonatype_dir
  owner nexus_user
  group nexus_group
  recursive true
  action :create
  notifies :run, 'execute[mv sonatype]', :immediately
end

execute 'mv sonatype' do
  cwd tmp_dir
  command "mv -fuT #{tmp_dir}'/'sonatype-work #{sonatype_dir}"
  action :nothing
  notifies :delete, 'file[tar ball]', :immediately
end

file 'tar ball' do
  owner nexus_user
  group nexus_group
  path tar_ball
  action :nothing
end
