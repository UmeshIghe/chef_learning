#
# Cookbook Name:: chef_learning
# Recipe:: server
#
# Copyright (c) 2020 The Authors, All Rights Reserved.
#
#
#
#
package 'httpd'

template '/var/www/html/index.html' do
 source 'index.html.erb'
# notifies :restart , 'service[httpd]', :immediately
end

service 'httpd' do
 action [ :enable, :start ]
 subscribes :restart, 'template[/var/www/html/index.html]', :immediately
end

