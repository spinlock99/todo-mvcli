`import Ember from 'ember'`

ApplicationController = Ember.ArrayController.extend
  remaining: (->
    return @filterBy('isCompleted', false).get('length')
  ).property('@each.isCompleted')

  s: (->
    return 's' unless @get('remaining') is 1
  ).property('@each.isCompleted')

  completed: (->
    return @filterBy('isCompleted', true).get('length')
  ).property('@each.isCompleted')

  hasCompleted: (->
    return @get('completed') > 0
  ).property('completed')

  actions:
    createTodo: ->
      return unless title = @get('newTitle')?.trim()

      @set('newTitle', '')
      @store.createRecord('todo',
        title: title
        isCompleted: false
      ).save()

    clearCompleted: ->
      completed = @filterBy('isCompleted', true)
      completed.invoke('deleteRecord')
      completed.invoke('save')

`export default ApplicationController`
