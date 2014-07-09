import Ember from 'ember';

var Router = Ember.Router.extend({
  location: FrontendENV.locationType
});

Router.map(function() {
  // ...
  this.resource('live', function() {
    this.route('prologue');
  });
});

export default Router;
