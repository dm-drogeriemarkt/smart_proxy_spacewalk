require 'test_helper'
require 'smart_proxy_spacewalk/configuration_loader'
require 'smart_proxy_spacewalk/spacewalk_plugin'

ENV['RACK_ENV'] = 'test'

class TestSpacewalkClient
  def login!; end
  def delete_host(hostname); end
  def logout!; end
end

module Proxy::Spacewalk
  module DependencyInjection
    include Proxy::DependencyInjection::Accessors
    def container_instance
      Proxy::DependencyInjection::Container.new do |c|
        c.singleton_dependency :spacewalk_client_impl, TestSpacewalkClient
      end
    end
  end
end

require 'smart_proxy_spacewalk/spacewalk_api'

class SpacewalkApiTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Proxy::Spacewalk::Api.new
  end

  def test_deletes_host
    TestSpacewalkClient.any_instance.expects(:login!).once
    TestSpacewalkClient.any_instance.expects(:delete_host).with('host.example.com').once
    TestSpacewalkClient.any_instance.expects(:logout!).once
    delete '/host/host.example.com'
    assert last_response.ok?, "Last response was not ok: #{last_response.status} #{last_response.body}"
    assert_empty last_response.body
  end
end
