`import Ember from 'ember'`

ChatRoute = Ember.Route.extend
  model: ->
    @store.find 'message',
      orderBy: 'timestamp'
      limitToLast: 20

`export default ChatRoute`
