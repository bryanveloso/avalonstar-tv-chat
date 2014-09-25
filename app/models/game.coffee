`import DS from 'ember-data'`

Game = DS.Model.extend
  name: DS.attr 'string'
  gbid: DS.attr 'string'

  broadcast: DS.belongsTo('broadcast',
    async: true
  )

`export default Game`
