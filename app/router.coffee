`import Ember from 'ember'`

Router = Ember.Router.extend
  location: AvalonstarENV.locationType

Router.map ->
  @resource 'chat',
    path: '/live/chat'
  , ->
    @resource 'chat-message'

  # this.resource('chat', { path: '/live/chat' })
  # @route 'chat-message'

`export default Router`
