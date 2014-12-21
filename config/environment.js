/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'avalonstar',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    contentSecurityPolicy: {
      'connect-src': "'self' wss://*.firebaseio.com imraising.tv",
      'default-src': "'none'",
      'font-src': "'self' data: use.typekit.net",
      'img-src': "'self' static-cdn.jtvnw.net",
      'media-src': "'self' avalonstar-tv.s3.amazonaws.com",
      'script-src': "'self' 'unsafe-inline' 'unsafe-eval' www.nightdev.com",
      'style-src': "'self' 'unsafe-inline' cloud.typography.com",
    },
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };

  if (environment === 'development') {
    // ENV.APP.LOG_RESOLVER = true;
    ENV.APP.LOG_ACTIVE_GENERATION = true;
    // ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  // Environment variables.
  ENV.IMR_KEY = process.env.IMR_KEY;

  return ENV;
};
