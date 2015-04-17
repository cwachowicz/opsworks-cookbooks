package "nginx"

include_recipe "nginx::service"

service "nginx" do
    action [ :enable, :start ]
end