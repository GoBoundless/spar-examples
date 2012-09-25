# Spar App Example

Here's how to get an app up and running with some of our favorite tools: jQuery, Twitter Bootstrap & Backbone. The twist is we use Bower for painless installation:

    # if you haven't already…
    gem install spar
    
    # create a new spar app
    spar new my-app
    
    # go into your app's directory
    cd my-app
    
    # we like to use [pow](http://pow.cx)
    powify create www.my-app
    
    # use bower to install some components (npm install bower -g)
    bower install jquery backbone

    # add them to application.js.coffee
    subl app/javascripts/application.js.coffee
      #= require jquery/jquery
      #= require underscore/underscore
      #= require backbone/backbone
      #= require_tree .

    # gotta have my bootstrap-sass
    subl Gemfile
      group :assets do
        require 'compass'
        require 'bootstrap-sass'
      end

    bundle install

    # add bootstrap to our stylesheet
    subl app/javascripts/stylesheets.css.sass