`import Ember from 'ember'`

TodoController = Ember.Controller.extend
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

`export default TodoController`
