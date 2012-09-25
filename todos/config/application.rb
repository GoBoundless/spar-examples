require 'bundler'
Bundler.require

class App < Spar::Base
  HamlCoffeeAssets.config.namespace  = "window.HAML"
  HamlCoffeeAssets.config.escapeHtml = false

  register Spar::Assets
  
  get "/" do
    haml :index
  end

end