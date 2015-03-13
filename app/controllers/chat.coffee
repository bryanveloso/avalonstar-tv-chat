`import Ember from 'ember'`

Chat = Ember.ArrayController.extend
  arrangedContent: (->
    @get('content').sortBy('timestamp').slice(-20);
  ).property('content')

`export default Chat`
