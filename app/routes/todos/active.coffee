`import Ember from 'ember'`

TodosActiveRoute = Ember.Route.extend
  model: ->
    return @store.filter('todo', (todo) -> not todo.get('isCompleted'))

  renderTemplate: (controller) ->
    @render('todos/index', {controller: controller})

`export default TodosActiveRoute`
