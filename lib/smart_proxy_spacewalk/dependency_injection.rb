module Proxy::Spacewalk
  module DependencyInjection
    include Proxy::DependencyInjection::Accessors
    def container_instance
      @container_instance ||= ::Proxy::Plugins.instance.find { |p| p[:name] == :spacewalk }[:di_container]
    end
  end
end
