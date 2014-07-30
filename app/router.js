import Ember from 'ember';

var Router = Ember.Router.extend({
  location: AvalonstarENV.locationType
});

Router.map(function() {
  this.resource('live', function () {
    this.route('chat');
  });
});

export default Router;
