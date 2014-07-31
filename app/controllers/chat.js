import Ember from 'ember';

export default Ember.Controller.extend(EmberPusher.Bindings, {
  // Data.
  array: [],

  // Pusher.
  PUSHER_SUBSCRIPTIONS: { chat: ['message'] },
  actions: {
    message: function(data) {
      console.log(data);
      data.style = 'color: ' + data.color;
      this.array.pushObject(data);
    }
  }
});
