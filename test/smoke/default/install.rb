# Cookbook Name:: chef_nexus
# Test:: install

describe package('java-1.8.0-openjdk') do
  it { should be_installed }
end
