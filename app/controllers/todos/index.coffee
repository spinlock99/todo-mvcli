`import Ember from 'ember'`

TodosIndexController = Ember.ArrayController.extend
  actions:
    createTodo: ->
      return unless title = @get('newTitle')?.trim()

      todo = @store.createRecord 'todo',
        title: title
        isCompleted: false

      @set('newTitle', '')

      todo.save()

`export default TodosIndexController`
