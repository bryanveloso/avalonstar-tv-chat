`import Ember from 'ember'`

ChatMessageComponent = Ember.Component.extend
  classNames: ['chat-line', 'hidden']
  tagName: 'li'

  # Attribute bindings.
  attributeBindings: ['username:data-username']
  username: Ember.computed.alias('message.username')

  didInsertElement: ->
    @get('parentView').send('scroll')

`export default ChatMessageComponent`
