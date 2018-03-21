require 'sinatra'

module Proxy::Spacewalk
  class Api < ::Sinatra::Base
    extend Proxy::Spacewalk::DependencyInjection

    helpers ::Proxy::Helpers

    authorize_with_trusted_hosts
    authorize_with_ssl_client

    use Rack::MethodOverride

    inject_attr :spacewalk_client_impl, :spacewalk_client

    delete '/host/:hostname' do |hostname|
      begin
        begin
          spacewalk_client.login!
          spacewalk_client.delete_host(hostname)
        ensure
          spacewalk_client.logout!
        end
        nil
      rescue ::Proxy::Spacewalk::HostNotFound
        log_halt 404, "Hostname #{hostname} could not be found."
      rescue Exception => e
        log_halt 400, e
      end
    end
  end
end
