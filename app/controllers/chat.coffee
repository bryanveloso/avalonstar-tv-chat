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

    data.message = @emoticonize(data.message, data.emotes)
    data.message = @linkify(data.message)
    @messages.pushObject data
    return

  emoticonize: (message, emotes) ->
    # Add the default emotes to the set.
    emotes = emotes.concat ['default']
    for set in emotes
      unless typeof @emoticon_sets[set] is 'undefined'
        for emote in @emoticon_sets[set]
          if message.match(emote.regex)
            message = message.replace(emote.regex, emote.html)
    return message

  linkify: (message) ->
    # URLs starting with http://, https://, or ftp://
    replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim
    linkifiedText = message.replace(replacePattern1, '<a href="$1" target="_blank">$1</a>')

    # URLs starting with "www." (without // before it, or it'd re-link the ones done above).
    replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim
    linkifiedText = message.replace(replacePattern2, '$1<a href="http://$2" target="_blank">$2</a>')

    return linkifiedText

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
        if regex.indexOf("(") >= 0
          regex = regex.replace("(p|P)", "(?:p|P)")
          regex = regex.replace("(o|O)", "(?:o|O)")
          regex = regex.replace("(S|s)", "(?:S|s)")
          regex = regex.replace("(_|\\.)", "(?:_|\\.)")
        regex = "\\b#{regex}\\b" if regex.match(/^\w+$/)
        regex = new RegExp(regex, 'g')

        for image in emoticon.images
          emoticon_set_id = image.emoticon_set or 'default'
          emoticon_set = self.emoticon_sets[emoticon_set_id] = self.emoticon_sets[emoticon_set_id] or []
          image.id = id++

          emoticon_set.push
            is_emoticon: true
            class: "emo-#{image.id}"
            html: " <span class=\"emo-#{image.id} emoticon\"></span> "
            regex: regex

      self.set('emoticons', json.emoticons)
      console.log "#{self.emoticons.length} emoticons loaded."

  styleEmoticons: (->
    styles = ''
    images = 0

    console.log 'Styling emoticons...'

    #
    for emoticon in @get('emoticons')
      for image in emoticon.images
        images++
        styles += """
        .emo-#{image.id} {
          background-image: url('#{image.url}');
          width: #{image.width}px; height: #{image.height}px;
          margin-top: #{(image.height - 18) / 2}px; }

        """

    console.log "#{images} images styled."
    return "<style>#{styles}</style>"
  ).property('emoticons.[]')

  # Actions.
  actions:
    message: (data) ->
      @pushMessage data
)

`export default Chat`
