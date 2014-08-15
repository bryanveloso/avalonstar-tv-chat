`import Ember from 'ember'`

ChatMessageController = Ember.ObjectController.extend
  messageLength: (->
    @get('message').length
  ).property('message')

  processedMessage: (->
    message = @get('message')
    emotes = @get('emote_list').concat ['default']
    sets = @get('emoticons.sets')

    for set in emotes
      unless typeof sets[set] is 'undefined'
        for emote in sets[set]
          if message.match(emote.regex)
            message = message.replace(emote.regex, emote.html)
    return message
  ).property('message', 'emote_list', 'emoticons.sets')

`export default ChatMessageController`
