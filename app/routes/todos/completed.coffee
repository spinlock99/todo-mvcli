`import Ember from 'ember'`

TodosCompletedRoute = Ember.Route.extend
  model: ->
    return @store.filter('todo', (todo) -> todo.get('isCompleted'))

  renderTemplate: (controller) ->
    @render('todos/index', {controller: controller})

`export default TodosCompletedRoute`
