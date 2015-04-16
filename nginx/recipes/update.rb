file "#{node[:nginx][:dir]}/sites-enabled/default" do
    action :delete
end

template "#{node[:nginx][:dir]}/sites-enabled/default" do
    source "localz-site.erb"
    owner "root"
    group "root"
    mode 0644
end

include_recipe "nginx::service"

service "nginx" do
  action [ :restart ]
end