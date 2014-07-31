import Ember from 'ember';

var Router = Ember.Router.extend({
  location: AvalonstarENV.locationType
});

Router.map(function() {
  this.resource('chat', { path: '/live/chat' });
});

export default Router;
