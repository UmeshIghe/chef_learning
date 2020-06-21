package 'httpd'

template 'var/www/html/index.html' do
  source 'index.html.erb'
end

remote_file '/var/www/html/japan.jpg' do
  source 'https://chef.blob.core.windows.net/demochef/IMG_2401.JPG'
end

bash "inline script" do
  user 'root'
  code "mkdir -p /var/www/html/mysites/"
 # not_if '[ -d /var/www/mysites/]'
  not_if do
     File.directory?('/var/www/mysites')
  end
end

#execute "run script" do
 # user "root"
#command './myscript.sh'
  #command <<-EOH
#  mkdir -p /var/www/mysites/
 # EOH
  #not_if
#end

#directory "/var/www/mysites" do
#  owner 'apache'
#  recursive true
#end



#
#cookbook_file '/var/www/html/index.html' do
 # source 'index.html'
#end

service 'httpd' do
  action [ :enable , :start ]
end
