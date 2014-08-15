`import Ember from 'ember'`

ChatMessageController = Ember.ObjectController.extend
  messageLength: (->
    @get('message').length
  ).property('message')

  # emoticonsReady: (->
  #   console.log 'ready!'
  # ).observes('parentController.emoticon_sets.[]')

  processedMessage: (->
    message = @get('message')
    # console.log message

    emotes = @get('emote_list').concat ['default']
    # console.log emotes

    # console.log @get('parentController').emoticon_sets

    # emotes = @get('emotes').split(',').concat ['default']
    sets = @get('emoticons.sets')

    for set in emotes
      unless typeof sets[set] is 'undefined'
        for emote in sets[set]
          if message.match(emote.regex)
            message = message.replace(emote.regex, emote.html)
    return message
  ).property('message', 'emote_list', 'parentController.emoticon_sets.[]')

`export default ChatMessageController`
