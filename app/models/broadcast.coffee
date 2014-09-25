`import DS from 'ember-data'`

Broadcast = DS.Model.extend
  number: DS.attr 'number'

  # Metadata. Dates.
  length: DS.attr 'string'
  airdate: DS.attr('date',
    defaultValue: ->
      new Date()
  )

  # Broadcast statuses (special, charity, etc.)
  isAfterDark: DS.attr 'boolean'
  isCharity: DS.attr 'boolean'
  isCoworker: DS.attr 'boolean'
  isFamily: DS.attr 'boolean'
  isMarathon: DS.attr 'boolean'

  # Status. Much like Twitch's `status`, but can be used for other purposes.
  # i.e., comments or special guests.
  status: DS.attr 'string'

  # Games played.
  games: DS.hasMany('game',
    async: true
  )

`export default Broadcast`
