`import Ember from 'ember'`

ChatMessageController = Ember.ObjectController.extend
  linkify: (inputText) ->
    # URLs starting with http://, https://, or ftp://
    replacePattern1 = /(\b(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;]*[-A-Z0-9+&@#\/%=~_|])/gim
    replacedText = inputText.replace(replacePattern1, '<a href="$1" target="_blank">$1</a>')

    # URLs starting with "www." (without // before it, or it'd re-link the ones done above).
    replacePattern2 = /(^|[^\/])(www\.[\S]+(\b|$))/gim
    replacedText = replacedText.replace(replacePattern2, '$1<a href="http://$2" target="_blank">$2</a>')
    return replacedText

  processedMessage: (->
    message = @get('message')
    emotes = @get('emote_list').concat ['default']
    sets = @get('emoticons.sets')

    # Escape "<" so hearts will work.
    message = message.replace('<3', '&lt;3')

    for set in emotes
      unless typeof sets[set] is 'undefined'
        for emote in sets[set]
          if message.match(emote.regex)
            message = message.replace(emote.regex, emote.html)
            message = @linkify(message)
    return message
  ).property('message', 'emote_list', 'emoticons.sets')

`export default ChatMessageController`
