`import DS from 'ember-data'`

Todo = DS.Model.extend
  title: DS.attr 'string'
  isCompleted: DS.attr 'boolean'

`export default Todo`
