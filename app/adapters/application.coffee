`import DS from 'ember-data'`
### global Firebase ###

ApplicationAdapter = DS.FirebaseAdapter.extend
  firebase: new Firebase 'https://avalonstar.firebaseio.com'

`export default ApplicationAdapter`
