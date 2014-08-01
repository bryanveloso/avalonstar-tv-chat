`import Ember from 'ember'`

Chat = Ember.Controller.extend(EmberPusher.Bindings,
  # Pusher configuration.
  PUSHER_SUBSCRIPTIONS:
    chat: ['message']
  logPusherEvents: true,

  # Data.
  messages: []

  # Methods.
  pushMessage: (data) ->
    data.style = "color: #{data.color}"
    if data.username is 'avalonstar'
      data.broadcaster = true
    if data.roles? and ('staff' and 'admin' in data.roles)
      data.roles = data.roles.filter (role) -> role isnt 'admin'

    @messages.pushObject data
    return

  # Actions.
  actions:
    message: (data) ->
      @pushMessage data
      return
)

`export default Chat`
