`import DS from 'ember-data'`

Host = DS.Model.extend
  timestamp: DS.attr 'number'
  username: DS.attr 'string'
  viewers: DS.attr 'number'

`export default Host`
