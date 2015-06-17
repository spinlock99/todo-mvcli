`import Ember from 'ember'`

TodoController = Ember.Controller.extend
  isEditing: false

  title: (->
    return @get('model.title')
  ).property('model.title')

  isCompleted: ((key, value) ->
    unless value? # getter
      return @get('model.isCompleted')
    else # setter
      model = @get('model')
      model.set('isCompleted', value)
      model.save()
      return value
  ).property('model.isCompleted')

  actions:
    editTodo: ->
      @set('isEditing', true)

    acceptChanges: ->
      @set('isEditing', false)
      unless @get('title.length')
        # Debounce call because it will fire on the insert-newline and
        # focus-out events. Let's see if it handles edits.
        Ember.run.debounce(@, 'send', 'removeTodo', 50)
      else
        @get('model').save()

    removeTodo: ->
      todo = @get('model')
      todo.deleteRecord()
      todo.save()

`export default TodoController`
