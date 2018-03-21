require 'smart_proxy_spacewalk/spacewalk_api'

map '/spacewalk' do
  run Proxy::Spacewalk::Api
end
