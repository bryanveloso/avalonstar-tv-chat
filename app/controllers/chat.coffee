`import Ember from 'ember'`

Chat = Ember.ArrayController.extend
  arrangedContent: (->
    @get('content').slice(-20);
  ).property('content')

`export default Chat`
