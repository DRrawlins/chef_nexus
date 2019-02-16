require 'spec_helper'

describe 'chef_nexus::install_nexus' do
  context 'default' do
    let(:nexus_user)          { 'nexus' }
    let(:nexus_group)         { 'nexus' }

    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['chef_nexus']['nexus_user']           = nexus_user
        node.normal['chef_nexus']['nexus_group']          = nexus_group
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
    end

    it 'creates the user' do
      expect(chef_run).to create_user(nexus_user)
    end

    it 'creates the group' do
      expect(chef_run).to create_group(nexus_group)
        .with_members([nexus_user])
    end
  end

  context 'non-default' do
    let(:nexus_user)          { 'nexus' }
    let(:nexus_group)         { 'nexus' }

    cached(:chef_run) do
      ChefSpec::ServerRunner.new do |node|
        node.normal['chef_nexus']['nexus_user']           = nexus_user
        node.normal['chef_nexus']['nexus_group']          = nexus_group
      end.converge(described_recipe)
    end

    before do
      allow_any_instance_of(Chef::Recipe).to receive(:include_recipe)
    end

    it 'creates the user' do
      expect(chef_run).to create_user(nexus_user)
    end

    it 'creates the group' do
      expect(chef_run).to create_group(nexus_group)
        .with_members([nexus_user])
    end
  end
end
