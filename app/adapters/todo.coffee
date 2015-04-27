`import DS from 'ember-data'`

TodoAdapter = DS.RESTAdapter.extend
  namespace: 'api'
  host: 'http://localhost:4200'

`export default TodoAdapter`
