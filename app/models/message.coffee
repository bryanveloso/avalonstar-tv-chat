`import DS from 'ember-data'`

Message = DS.Model.extend
  color: DS.attr 'string'
  emotes: DS.attr 'string'
  is_emote: DS.attr 'boolean'
  message: DS.attr 'string'
  roles: DS.attr 'string'
  timestamp: DS.attr 'string'
  username: DS.attr 'string'

  # Computed properties.
  emote_list: (->
    @get('emotes')?.split(',')
  ).property('emotes')
  role_list: (->
    @get('roles')?.split(',')
  ).property('roles')

  # Rendering/Display properties.
  style: (->
    color = @get 'color'
    "color: #{color}"
  ).property('color')

`export default Message`
