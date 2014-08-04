`import Ember from 'ember'`

Chat = Ember.View.extend
  classNames: ['chat']
  templateName: 'chat'

  _scroll: ->
    container = @$('.chat-list')
    container.animate
      scrollTop: container.prop('scrollHeight')
    , 250

    latestMessage = @$('.chat-line:last')
    latestMessage.addClass 'visible'

  actions:
    scroll: ->
      Ember.run.debounce(@, @_scroll, 150)

`export default Chat`
