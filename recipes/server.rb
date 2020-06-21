package 'httpd'

template 'var/www/html/index.html' do
  source 'index.html.erb'
end

remote_file '/var/www/html/japan.jpg' do
  source 'https://chef.blob.core.windows.net/demochef/IMG_2401.JPG'
end

#
#cookbook_file '/var/www/html/index.html' do
 # source 'index.html'
#end

service 'httpd' do
  action [ :enable , :start ]
end
