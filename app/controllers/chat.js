import Ember from 'ember';

export default Ember.Controller.extend(EmberPusher.Bindings, {
  // Data.
  array: [],

  // Pusher.
  PUSHER_SUBSCRIPTIONS: { chat: ['message'] },
  actions: {
    message: function(data) {
      console.log(data);
      this.array.pushObject(data);
    }
  }
});
