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
      console.log 'isEditing'
      @set('isEditing', true)

`export default TodoController`
