`import Ember from 'ember'`
`import config from './config/environment'`

Router = Ember.Router.extend
  location: config.locationType

Router.map ->
  # Chat.
  @resource 'chat', ->
    @resource 'chat-message'
  @route 'donation'
  @route 'notifier'

`export default Router`
