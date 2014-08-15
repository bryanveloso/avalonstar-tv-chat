`import Ember from 'ember'`

Chat = Ember.View.extend
  classNames: ['chat']
  templateName: 'chat'

  _scroll: ->
    container = @$('.chat-list')
    container.animate
      scrollTop: container.prop('scrollHeight')
    , 250

    # Reveal all messages.
    @$('.chat-line').addClass 'visible'
    @$('.chat-line:last').addClass 'last'
    @$('.chat-line:not(:last)').removeClass 'last'

  actions:
    scroll: ->
      Ember.run.debounce(@, @_scroll, 150)

`export default Chat`
