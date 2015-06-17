# This comment is really conflicted.

import Ember from 'ember'

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

  # combining getters and setters is deprecated now.
  allAreDone: ((key, value) ->
    return @get('length') and @isEvery('isCompleted') unless value?

    @setEach('isCompleted', value)
    @invoke('save')
    return value
  ).property('@each.isCompleted')

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

export default ApplicationController
