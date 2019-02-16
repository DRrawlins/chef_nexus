name 'chef_nexus'
maintainer 'Daniel Rawlins'
maintainer_email 'danrawlins07@gmail.com'
license          'MIT'
description 'Installs/Configures chef_nexus'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.0'

%w{fedora}.each do |os|
  supports os
end

source_url 'https://github.com/DRrawlins/chef_nexus'
issues_url 'https://github.com/DRrawlins/chef_nexus/issues'

chef_version '>= 14.10.9'
