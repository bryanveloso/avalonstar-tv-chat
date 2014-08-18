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
    @$('.chat-line').removeClass 'hidden'

  actions:
    scroll: ->
      Ember.run.debounce(@, @_scroll, 150)

`export default Chat`
