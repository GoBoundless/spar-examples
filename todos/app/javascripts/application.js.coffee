# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.

# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of gems, if any, can be referenced here using a relative path.

# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.

# Note: hamlcoffee is included in Spar. We love haml coffeescript/haml template (and we thing you should too)
#= require hamlcoffee

# From vendor/assets
#= require jquery.min
#= require spine
#= require route.min
#= require local

#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views

#= require app 