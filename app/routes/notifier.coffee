`import Ember from 'ember'`

NotifierRoute = Ember.Route.extend
  model: ->
    Ember.RSVP.hash
      hosts: @store.findAll 'host'
      subscriptions: @store.findAll 'subscription'

`export default NotifierRoute`
