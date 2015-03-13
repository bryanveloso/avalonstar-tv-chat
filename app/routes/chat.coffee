`import Ember from 'ember'`

ChatRoute = Ember.Route.extend
  model: ->
    d1 = new Date
    d2 = new Date(d1)
    start = String(d2.setMinutes d1.getMinutes() - 60)
    console.log start

    @store.find 'message',
      orderBy: 'timestamp'

`export default ChatRoute`
