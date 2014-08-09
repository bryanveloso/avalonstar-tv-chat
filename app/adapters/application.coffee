`import DS from 'ember-data'`

ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: new Firebase 'https://avalonstar.firebaseio.com'

`export default ApplicationAdapter`
