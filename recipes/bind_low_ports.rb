#
# Author:: Seandon Mooy
# Cookbook Name:: nodejs
# Recipe:: bind_low_ports
#

case node['platform']
when 'debian', 'ubuntu'
  package 'libcap2-bin'
when 'redhat', 'centos', 'fedora', 'amazon', 'scientific'
  package 'libcap'
end

execute 'setcap cap_net_bind_service=+ep $(readlink -f /usr/local/bin/node)'
