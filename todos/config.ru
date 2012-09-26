require 'bundler'
Bundler.require

HamlCoffeeAssets.config.namespace  = "window.HAML"
HamlCoffeeAssets.config.escapeHtml = false

run Spar.app