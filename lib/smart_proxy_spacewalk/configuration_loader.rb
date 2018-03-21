module ::Proxy::Spacewalk
  class ConfigurationLoader
    def load_classes
      require 'smart_proxy_spacewalk/dependency_injection'
      require 'smart_proxy_spacewalk/spacewalk_api'
      require 'smart_proxy_spacewalk/spacewalk_client'
    end

    def load_dependency_injection_wirings(container_instance, settings)
      container_instance.dependency :spacewalk_client_impl, (lambda do
        Proxy::Spacewalk::SpacewalkClient.new(
          :url => settings[:url],
          :login => settings[:login],
          :password => settings[:password]
        )
      end)
    end
  end
end
