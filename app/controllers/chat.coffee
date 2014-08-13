`import Ember from 'ember'`

Chat = Ember.ArrayController.extend
  itemController: 'chat-message'
  sortProperties: ['timestamp']

  init: ->
    @loadEmoticons()
    @_super()

  latest: (->
    # TIL: Ember will only show the slice.
    @get('arrangedContent').slice(-20)
  ).property('arrangedContent.[]')

  # Emoticon-related data.
  emoticons: []
  emoticon_sets: {}

  # Emoticon-related methods.
  loadEmoticons: ->
    self = @

    # We use Night's emotes instead of Twitch's because JSONP was disabled
    # on the endpoint: <https://github.com/justintv/Twitch-API/issues/136>
    Ember.$.getJSON 'https://www.nightdev.com/hosted/emotes.php?callback=?', (json) ->
      Ember.debug 'Loading emoticons...'

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
      Ember.debug "#{self.emoticons.length} emoticons loaded."

  styleEmoticons: (->
    styles = ''
    images = 0

    Ember.debug 'Styling emoticons...'

    #
    for emoticon in @get('emoticons')
      for image in emoticon.images
        images++
        styles += """
        .emo-#{image.id} {
          background-image: url('#{image.url}');
          width: #{image.width}px; height: #{image.height}px;
          margin-top: -#{(image.height - 18) / 2}px; }

        """

    Ember.debug "#{images} images styled."
    return "<style>#{styles}</style>"
  ).property('emoticons.[]')

`export default Chat`
