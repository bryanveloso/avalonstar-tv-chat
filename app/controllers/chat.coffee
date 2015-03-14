`import Ember from 'ember'`

Chat = Ember.ArrayController.extend
  arrangedContent: (->
    @get('model').slice(-20);
  ).property('model')

`export default Chat`
