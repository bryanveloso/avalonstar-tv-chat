import Ember from 'ember';

export default Ember.Controller.extend(EmberPusher.Bindings, {
  // Data.
  array: [],

  // Methods.
  pushMessage: function(data) {
    data.style = 'color: ' + data.color;
    if (data.username === 'avalonstar') {
      data.broadcaster = true;
    }

    var __indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };
    if ((data.roles != null) && ("staff" && __indexOf.call(data.roles, "admin") >= 0)) {
      data.roles = data.roles.filter(function(role) {
        return role !== "admin";
      });
    }

    this.array.pushObject(data);
  },

  // Pusher.
  PUSHER_SUBSCRIPTIONS: { chat: ['message'] },
  actions: {
    message: function(data) {
      this.pushMessage(data);
    }
  }
});
