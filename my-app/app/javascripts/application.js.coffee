# This is a manifest file that'll be compiled into application.js, which will include all the files
# listed below.

# Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
# or vendor/assets/javascripts of gems, if any, can be referenced here using a relative path.

# It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
# the compiled file.

#= require jquery/jquery
#= require underscore/underscore
#= require backbone/backbone
#= require bootstrap/docs/assets/js/bootstrap
#= require_tree .

class MyRouter extends Backbone.Router
  routes:
    "": "init"
    "home": "home"
    "about": "about"

  init: ->
    @navigate('home',true)

  home: ->
    $.get('/home.html', (data) ->
      $('#content').html(data)
      $('#home-trigger').parent().siblings().removeClass 'active'
      $('#home-trigger').parent().addClass('active')
    )

  about: ->
    $.get('/about.html', (data) ->
      $('#content').html(data)
      $('#about-trigger').parent().siblings().removeClass 'active'
      $('#about-trigger').parent().addClass('active')
    )

$ ->

  App = new MyRouter()
  Backbone.history.start()


  $('#home-trigger,#about-trigger').click (e) ->
    e.preventDefault()

  $('#home-trigger').click ->
    App.navigate('home', true)
  $('#about-trigger').click ->
    App.navigate('about', true)