require 'bundler/setup'
Bundler.require if File.exists?('Gemfile')

HamlCoffeeAssets.config.namespace  = "window.HAML"
HamlCoffeeAssets.config.escapeHtml = false

map "/" do
  run Spar.app
end