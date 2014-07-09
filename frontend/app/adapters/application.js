import DS from "ember-data";

var ApplicationAdapter = DS.SailsSocketAdapter.extend({
  namespace: 'api',
  log: true
});

export default ApplicationAdapter;
