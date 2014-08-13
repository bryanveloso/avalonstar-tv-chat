`import Ember from 'ember'`

ChatMessageController = Ember.ObjectController.extend
  messageLength: (->
    @get('message').length
  ).property('message')

  # emoticonsReady: (->
  #   console.log 'ready!'
  # ).observes('parentController.emoticon_sets.[]')

  displayMessage: (->
    message = @get('message')
    # console.log message

    emotes = @get('emote_list').concat ['default']
    # console.log emotes

    # console.log @get('parentController').emoticon_sets

    # emotes = @get('emotes').split(',').concat ['default']
    emoticon_sets = @get('parentController').emoticon_sets

    for set in emotes
      unless typeof emoticon_sets[set] is 'undefined'
        for emote in emoticon_sets[set]
          if message.match(emote.regex)
            message = message.replace(emote.regex, emote.html)
    return message
  ).property('message', 'emote_list', 'parentController.emoticon_sets.[]')

`export default ChatMessageController`
