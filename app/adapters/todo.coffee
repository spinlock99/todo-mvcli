`import DS from 'ember-data'`

TodoAdapter = DS.LSAdapter.extend
  namespace: 'todo-embercoffee'

#TodoAdapter = DS.RESTAdapter.extend
#  namespace: 'api'
#  host: 'http://localhost:4200'

`export default TodoAdapter`
