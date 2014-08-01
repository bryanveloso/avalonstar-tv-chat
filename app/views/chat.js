import Ember from 'ember';

export default Ember.View.extend({
  scrolling: function() {
    console.log('inserted!');
  }.observes('controller.array.@each')
});
