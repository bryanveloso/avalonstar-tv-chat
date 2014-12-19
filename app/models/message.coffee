`import DS from 'ember-data'`

Message = DS.Model.extend
  color: DS.attr 'string'
  display_name: DS.attr 'string'
  emotes: DS.attr 'string'
  is_emote: DS.attr 'boolean'
  message: DS.attr 'string'
  roles: DS.attr 'string'
  timestamp: DS.attr 'number'
  username: DS.attr 'string'

  # Computed properties.
  emote_list: (->
    list = @get('emotes')?.split(',')
    return list or []
  ).property('emotes')
  role_list: (->
    @get('roles')?.split(',')
  ).property('roles')

  # Rendering/Display properties.
  style: (->
    color = @get 'color'
    "color: #{color}"
  ).property('color')

  # Is this message purged?
  is_purged: DS.attr 'boolean'

`export default Message`
