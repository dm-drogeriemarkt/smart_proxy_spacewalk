require 'xmlrpc/client'

module Proxy::Spacewalk
  class SpacewalkClient
    include ::Proxy::Log

    attr_reader :key, :url, :login, :password

    def initialize(opts = {})
      @url = opts[:url]
      @login = opts[:login]
      @password = opts[:password]
      client.instance_variable_get(:@http).verify_mode = OpenSSL::SSL::VERIFY_NONE
    end

    def get_host_id_by_hostname(hostname)
      systems = client.call('system.search.hostname', key, hostname)
      system_ids = systems.map { |system| system['id'] }
      id = system_ids.first
      raise ::Proxy::Spacewalk::HostNotFound unless id
      logger.debug "Spacewalk: Resolved hostname #{hostname} to ID #{id}"
      id
    end

    def delete_host(hostname)
      id = get_host_id_by_hostname(hostname)
      client.call('system.deleteSystem', key, id)
    end

    def login!
      logger.debug "Spacewalk: Login with username #{login}."
      @key = client.call('auth.login', login, password)
    end

    def logout!
      return unless key
      logger.debug "Spacewalk: Logout."
      client.call('auth.logout', key)
      @key = nil
    end

    private

    def client
      @client ||= XMLRPC::Client.new2(url)
    end
  end
end
