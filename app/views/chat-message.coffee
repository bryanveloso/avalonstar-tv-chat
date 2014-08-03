`import Ember from 'ember'`

ChatMessageView = Ember.View.extend
  didInsertElement: ->
    @get('parentView').send('scroll')

`export default ChatMessageView`
