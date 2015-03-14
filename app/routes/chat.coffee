`import Ember from 'ember'`

ChatRoute = Ember.Route.extend
  model: ->
    @store.find 'message'

`export default ChatRoute`
