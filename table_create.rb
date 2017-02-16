
# Cookbook Name:: oraclient-install
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
bash 'Select all users from dba_users' do             
  code <<-EOH
    sqlplus64 system/LetsDocker@sql-server:1521/ORCLPDB1 <<-SQLEOH
    CREATE TABLE demo_dev_env(
    id    NUMBER(10),
    data  VARCHAR2(50)
    );
    exit;
    SQLEOH
  EOH
end
