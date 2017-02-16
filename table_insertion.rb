
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
    INSERT INTO demo_qa_env (id, data)
    VALUES (66, 'Esta prueba es para los ambientes de QA');
    exit;
    SQLEOH
  EOH
end