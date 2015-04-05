`import Ember from 'ember'`

ChatMessageComponent = Ember.Component.extend
  classNames: ['chat-line', 'hidden']
  tagName: 'li'

  # Attribute bindings.
  attributeBindings: ['username:data-username']
  username: Ember.computed.alias('message.username')

  didInsertElement: ->
    @get('parentView').send('scroll')

    #
    maxMessages = 5
    linesToDelete = @$('.chat-line').length - maxMessages
    console.log linesToDelete

    if linesToDelete > 0
      i = 0
      while i < linesToDelete
        @$('.chat-line').eq(0).remove()
        console.log i
        i++

`export default ChatMessageComponent`
