`import Ember from 'ember'`

ChatMessageView = Ember.View.extend
  classNames: ['chat-line']
  tagName: 'li'
  templateName: 'chat-message'

  # Attribute bindings.
  attributeBindings: ['username:data-username']
  username: Ember.computed.alias('controller.username')

  didInsertElement: ->
    @get('parentView').send('scroll')

`export default ChatMessageView`
