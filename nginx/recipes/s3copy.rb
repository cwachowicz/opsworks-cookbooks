require 'aws-sdk'

s3 = AWS::S3.new

kitty = s3.buckets['spotz-temp-hosting'].objects['api-localz-co/cat.jpg']
index = s3.buckets['spotz-temp-hosting'].objects['api-localz-co/index.html']
privateKey = s3.buckets['spotz-temp-hosting'].objects['api-localz-co/Private.key']
privatePem = s3.buckets['spotz-temp-hosting'].objects['api-localz-co/Private.pem']

# Read content to variable
cat_content = kitty.read
index_content = index.read
privateKey_content = privateKey.read
privatePem_content = privatePem.read

# Write content to file
file '/usr/share/nginx/html/cat.jpg' do
  owner 'root'
  group 'root'
  mode '0755'
  content kitty.read
  action :create
end

# Write content to file
file '/usr/share/nginx/html/index.html' do
  owner 'root'
  group 'root'
  mode '0755'
  content index_content
  action :create
end

# Write content to file
file '/etc/ssl/certs/private.key' do
  owner 'root'
  group 'root'
  mode '600'
  content privateKey_content
  action :create
end

# Write content to file
file '/etc/ssl/certs/private.pem' do
  owner 'root'
  group 'root'
  mode '0600'
  content privatePem_content
  action :create
end
