`import Ember from 'ember'`

ApplicationRoute = Ember.Route.extend
  model: ->
    @store.find 'todo'
`export default ApplicationRoute`
