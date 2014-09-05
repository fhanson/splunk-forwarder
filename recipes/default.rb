#
# Cookbook Name:: splunk-forwarder
# Recipe:: default
# Copyright 2014 Cloud-Mgmt
#
# All rights reserved - Do Not Redistribute
#

remote_file node['splunk-forwarder']['installer'] do
  source node['splunk-forwarder']['download_url']
  backup false
  action :create
end

case node["platform"]
when "redhat", "centos", "amazon", "ubuntu"

  rpm_package node['splunk-forwarder']['installer'] do
    source node['splunk-forwarder']['installer']
    action :install
  end
  
  bash "accept license" do
    user 'root'
    cwd '/root'
    code <<-EOH
    su #{node['splunk-forwarder']['user']} /opt/splunkforwarder/bin/./splunk start --accept-license
    /opt/splunkforwarder/bin/./splunk enable boot-start -user #{node['splunk-forwarder']['user']}
    EOH
  end
  
when "windows"
  windows_package node['splunk-forwarder']['installer'] do
    source node['splunk-forwarder']['installer']
    action :install
    installer_type :custom
    options "LAUNCHSPLUNK=0 AGREETOLICENSE=Yes /quiet"
  end
  
  service "Splunkd" do
    action [:enable, :start]
  end
end

