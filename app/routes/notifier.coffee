`import Ember from 'ember'`

NotifierRoute = Ember.Route.extend
  model: ->
    return Ember.RSVP.hash
      hosts: this.store.findAll 'host'
      subscriptions: this.store.findAll 'subscriptions'

`export default NotifierRoute`
