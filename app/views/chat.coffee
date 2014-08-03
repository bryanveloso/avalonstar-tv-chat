`import Ember from 'ember'`

Chat = Ember.View.extend
  classNames: ['chat']
  templateName: 'chat'

  _scroll: ->
    container = @$('.chat-list')
    container.scrollTop container.prop('scrollHeight')

  actions:
    scroll: ->
      Ember.run.debounce(@, @_scroll, 150)

`export default Chat`
