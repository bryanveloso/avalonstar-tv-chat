`import DS from 'ember-data'`

Subscription = DS.Model.extend
  timestamp: DS.attr 'number'
  username: DS.attr 'string'

`export default Subscription`
