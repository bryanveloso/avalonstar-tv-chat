`import Ember from 'ember'`

Chat = Ember.View.extend
  templateName: 'chat'

  # Emoticon-related data.
  default_emoticons: []
  emoticon_sets: []
  emoticons: []

  # Emoticon-related methods.
  loadEmotes: (->
    # # We use Night's emotes instead of Twitch's because JSONP was disabled
    # # on the endpoint: <https://github.com/justintv/Twitch-API/issues/136>
    # Ember.$.getJSON 'https://www.nightdev.com/hosted/emotes.php?callback=?', (json) ->
    #   console.log 'Loading emotes...'
    #   for emoticon in json.emoticons
    #     emoticon.regex = if emoticon.regex.match(/^\w+$/) then new RegExp("\\b#{emoticon.regex}\\b", 'g') else new RegExp(emoticon.regex, 'g')

    #     index = 1
    #     for image in emoticon.images
    #       index += 1
    #       image.html = "<span class=\"emo-#{index}\" emoticon></span>"
    #       console.log index

  ).observes('controller.isLoaded')

  scrolling: (->
    container = @$('.chat')
    container[0].scrollTop = container[0].scrollHeight if container?
  ).observes('controller.messages.length')

`export default Chat`
