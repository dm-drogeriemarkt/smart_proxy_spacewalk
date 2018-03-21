module Proxy::Spacewalk
  class HostNotFound < RuntimeError; end

  class Plugin < ::Proxy::Plugin
    plugin 'spacewalk', Proxy::Spacewalk::VERSION

    http_rackup_path File.expand_path('spacewalk_http_config.ru', File.expand_path('../', __FILE__))
    https_rackup_path File.expand_path('spacewalk_http_config.ru', File.expand_path('../', __FILE__))

    load_classes ::Proxy::Spacewalk::ConfigurationLoader
    load_dependency_injection_wirings ::Proxy::Spacewalk::ConfigurationLoader

    validate_presence :url, :login, :password

    default_settings :validate_ssl => true

    validate_readable :contentpath
  end
end
