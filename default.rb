
# Cookbook Name:: oraclient-install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "apt-get update" do
  command "apt-get update"
end

execute "Installing alien package" do
  command "apt-get -y install alien"
end

execute "Installing required libs" do
  command "apt-get install -y libaio1"
end

remote_file '/root/SqlPlus_Client.tar' do
  source 'http://nexus:8081/nexus/content/repositories/thirdparty/Oracle/SqlPlus_Client/1/SqlPlus_Client-1.tar'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

execute 'unpack sqlplus package' do
  command 'tar -xvf /root/SqlPlus_Client.tar -C /root'
end

execute 'install sqlplus package 1' do
  command 'alien -i /root/oracle-instantclient12.1-sqlplus-12.1.0.2.0-1.x86_64.rpm'
end

execute 'install sqlplus package 2' do
  command 'alien -i /root/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm'
end

execute 'install sqlplus package 3' do
  command 'alien -i /root/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm'
end

template '/etc/ld.so.conf.d/oracle.conf' do
  source 'oracle.conf.erb'
  owner 'root'
  group 'root'
  mode '0755'
end

execute 'Final configuration step' do
  command 'ldconfig'
end
