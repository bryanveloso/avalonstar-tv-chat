`import Ember from 'ember'`

ChatRoute = Ember.Route.extend
  model: ->
    @store.findAll 'message'

`export default ChatRoute`
