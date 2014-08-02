`import Ember from 'ember'`

Chat = Ember.Controller.extend(EmberPusher.Bindings,
  init: ->
    @loadEmoticons()
    @_super()

  # Pusher configuration.
  PUSHER_SUBSCRIPTIONS:
    chat: ['message']
  logPusherEvents: true,

  # Chat-related data.
  messages: []

  # Chat-related methods.
  pushMessage: (data) ->
    data.style = "color: #{data.color}"
    if data.username is 'avalonstar'
      data.broadcaster = true
    if data.roles? and ('staff' and 'admin' in data.roles)
      data.roles = data.roles.filter (role) -> role isnt 'admin'

    @messages.pushObject data
    return

  # Emoticon-related data.
  emoticons: []
  emoticon_sets: {}

  # Emoticon-related methods.
  loadEmoticons: ->
    self = @

    # We use Night's emotes instead of Twitch's because JSONP was disabled
    # on the endpoint: <https://github.com/justintv/Twitch-API/issues/136>
    Ember.$.getJSON 'https://www.nightdev.com/hosted/emotes.php?callback=?', (json) ->
      console.log 'Loading emoticons...'

      id = 0
      for emoticon in json.emoticons
        regex = emoticon.regex
        regex = "\\b#{regex}\\b" if regex.match(/^\w+$/)
        regex = new RegExp(regex, 'g')

        for image in emoticon.images
          emoticon_set_id = image.emoticon_set or 'default'
          emoticon_set = self.emoticon_sets[emoticon_set_id] = self.emoticon_sets[emoticon_set_id] or []
          image.id = id++

          emoticon_set.push
            is_emoticon: true
            class: "emo-#{image.id}"
            regex: regex

      self.set('emoticons', json.emoticons)
      console.log "#{self.emoticons.length} emoticons loaded."

  styleEmoticons: (->
    self = @
    styles = ''

    #
    for emoticon in @get('emoticons')
      for image in emoticon.images
        console.log image

    return "<style>#{styles}</style>"
  ).property('emoticons.[]')

  # Actions.
  actions:
    message: (data) ->
      @pushMessage data
)

`export default Chat`
