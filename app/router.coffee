`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  @resource 'chat',
    path: '/live/chat'
  , ->
    @resource 'chat-message'

  # this.resource('chat', { path: '/live/chat' })
  # @route 'chat-message'

`export default Router`
