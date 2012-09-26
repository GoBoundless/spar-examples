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
