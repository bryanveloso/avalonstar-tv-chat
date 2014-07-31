import Ember from 'ember';
import Resolver from 'ember/resolver';
import loadInitializers from 'ember/load-initializers';

Ember.MODEL_FACTORY_INJECTIONS = true;

var App = Ember.Application.extend({
  modulePrefix: 'avalonstar', // TODO: loaded via config
  Resolver: Resolver,

  // Configuration for ember-pusher.
  PUSHER_OPTS: { key: '207f2c96da3bdb9301f8', connection: {} }
});

loadInitializers(App, 'avalonstar');

export default App;
