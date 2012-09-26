class window.Todos extends Spine.Controller
	ENTER_KEY = 13

	elements:
		'.edit': 'editElem'

	events:
		'click    .destroy': 'remove'
		'click    .toggle':  'toggleStatus'
		'dblclick label':    'edit'
		'keyup    .edit':    'finishEditOnEnter'
		'blur     .edit':    'finishEdit'

	constructor: ->
		super
		@todo.bind 'update', @render
		@todo.bind 'destroy', @release

	render: =>
		@replace @view('todo_item', @todo)
		this

	###
	  view
	
	  HAML rendering method to allow HAML instead of Handlebars
	  changed for Spar as we prefer coffee-haml
	
	  parameters:
	    name - string; name of the template file, name.hamlc
			context - Object; 'this' in the template will refer to the context object

	  returns:
	  	if a template exists, returns the template method loaded with the context object
	    
	###
	view: (name, context = {}) ->
    template = HAML["views/#{name}"]
    if template?
      template(context)

	remove: ->
		@todo.destroy()

	toggleStatus: ->
		@todo.updateAttribute 'completed', !@todo.completed

	edit: ->
		@el.addClass 'editing'
		@editElem.focus()

	finishEdit: ->
		@el.removeClass 'editing'
		val = $.trim @editElem.val()
		if val then @todo.updateAttribute( 'title', val ) else @remove()

	finishEditOnEnter: (e) ->
		@finishEdit() if e.which is ENTER_KEY
