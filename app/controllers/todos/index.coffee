`import Ember from 'ember'`

TodosIndexController = Ember.ArrayController.extend
  remaining: (->
    return @filterBy('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  s: (->
    return 's' unless @get('remaining') is 1
  ).property('@each.isCompleted')

  actions:
    createTodo: ->
      return unless title = @get('newTitle')?.trim()

      todo = @store.createRecord 'todo',
        title: title
        isCompleted: false

      @set('newTitle', '')

      todo.save()

`export default TodosIndexController`
