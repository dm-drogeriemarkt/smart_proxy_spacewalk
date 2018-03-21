require 'test_helper'
require 'smart_proxy_spacewalk/spacewalk_client'

ENV['RACK_ENV'] = 'test'

class SpacewalkClientTest < Test::Unit::TestCase

  def setup
    @client = Proxy::Spacewalk::SpacewalkClient.new(
      :url => 'https://spacewalk.example.com/rpc/api',
      :login => 'user',
      :password => 'password'
    )
  end

  def test_login!
    stub_xml_rcp_request(:login)
    @client.login!
    assert_equal key, @client.key
  end

  def test_logout!
    stub_xml_rcp_request(:logout)
    @client.stubs(:key).returns(key)
    @client.logout!
  end

  def test_get_host_id_by_hostname
    stub_xml_rcp_request(:system_search_hostname)
    @client.stubs(:key).returns(key)
    assert_equal system_id, @client.get_host_id_by_hostname('host.example.com')
  end

  def test_delete_host
    @client.stubs(:key).returns(key)
    @client.stubs(:get_host_id_by_hostname).returns(system_id)
    stub_xml_rcp_request(:delete_system)
    assert @client.delete_host('host.example.com')
  end

  private

  def key
    '4267x91320b2a073b8bc29f5413395013d0a99ea365140762f0e21e1849842b635cb9'
  end

  def system_id
    1000010724
  end

  def stub_xml_rcp_request(fixture_key)
    stub_request(:post, 'https://spacewalk.example.com/rpc/api').
      with(:body => xml_fixture("#{fixture_key}_request")).
      to_return(:status => 200, :body => xml_fixture("#{fixture_key}_response"), :headers => {})
  end
end
