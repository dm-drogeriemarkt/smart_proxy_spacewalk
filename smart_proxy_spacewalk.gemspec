require File.expand_path('../lib/smart_proxy_spacewalk/version', __FILE__)

Gem::Specification.new do |s|
  s.name = 'smart_proxy_spacewalk'
  s.version = Proxy::Spacewalk::VERSION

  s.summary = 'Spacewalk integration support for smart-proxy'
  s.description = 'This plug-in adds support for managing hosts registered at a spacewalk server to Foreman\'s Smart Proxy.'
  s.authors = ['Timo Goebel']
  s.email = 'timo.goebel@dm.de'
  s.extra_rdoc_files = ['README.md', 'LICENSE']
  s.files = `git ls-files`.split("\n") - ['.gitignore']
  s.homepage = 'http://github.com/dm-drogeriemarkt/smart_proxy_spacewalk'
  s.license = 'GPLv3'

  s.add_dependency('json')

  s.add_development_dependency('test-unit', '~> 2')
  s.add_development_dependency('mocha', '~> 1')
  s.add_development_dependency('webmock', '~> 1')
  s.add_development_dependency('rack-test', '~> 0')
  s.add_development_dependency('rake', '~> 10')
end
