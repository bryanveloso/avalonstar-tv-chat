`import Ember from 'ember'`

Chat = Ember.View.extend
  scrolling: (->
    console.log 'inserted!'
  ).observes('controller.array.@each')

`export default Chat`
