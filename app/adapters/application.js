import Ember from 'ember';
import DS from 'ember-data';
/* global Firebase */

export default DS.FirebaseAdapter.extend({
  firebase: new Firebase('https://avalonstar.firebaseio.com'),

  init: function () {
    this._super.apply(this, arguments);
    this._findQueryMapForType = {};
  },

  // Basic support for Firebase queries.
  // - orderBy
  // - limitToFirst
  // - limitToLast
  // - startAt
  // - endAt
  // - equalTo
  findQuery: function(store, type, query) {
    var adapter = this;
    var ref = this._getRef(type);

    if (!query.orderBy || query.orderBy === '_key') {
      ref = ref.orderByKey();
    } else if (query.orderBy && query.orderBy !== '_priority') {
      ref = ref.orderByChild(query.orderBy);
    } else {
      ref = ref.orderByPriority();
    }

    if (query.limitToFirst && query.limitToFirst >= 0) {
      ref = ref.limitToFirst(query.limitToFirst);
    }

    if (query.limitToLast && query.limitToLast >= 0) {
      ref = ref.limitToLast(query.limitToLast);
    }

    if (query.startAt) {
      ref = ref.startAt(query.startAt);
    }

    if (query.endAt) {
      ref = ref.endAt(query.endAt);
    }

    if (query.equalTo) {
      ref = ref.equalTo(query.equalTo);
    }

    return new Ember.RSVP.Promise(function(resolve, reject) {
      // Listen for child events on the type.
      ref.once('value', function(snapshot) {
        if (!adapter._findAllHasEventsForType(type)) {
          adapter._findAllAddEventListeners(store, type, ref);
        }
        var results = [];
        snapshot.forEach(function(childSnapshot) {
          var payload = adapter._assignIdToPayload(childSnapshot);
          adapter._updateRecordCacheForType(type, payload);
          results.push(payload);
        });
        resolve(results);
      }, function(error) {
        reject(error);
      });
    }, Ember.String.fmt('DS: FirebaseAdapter#findQuery %@ with %@', [type, query]));
  },

  /**
    Keep track of what types `.findQuery()` has been called for
    so duplicate listeners aren't added.
  */
  _findQueryMapForType: undefined,

  /**
    Determine if the current type is already listening for children events.
  */
  _findQueryHasEventsForType: function(type, query) {
    return !Ember.isNone(this._findQueryMapForType[type + JSON.stringify(query)]);
  },

  /**
    After `.findQuery()` is called on a type, continue to listen for
    `child_added`, `child_removed`, and `child_changed`.
  */
  _findQueryAddEventListeners: function(store, type, ref, query) {
    this._findQueryMapForType[type + JSON.stringify(query)] = true;

    var deferred = Ember.RSVP.defer();
    var adapter = this;
    var serializer = store.serializerFor(type);
    var valueEventTriggered = false;

    deferred.promise.then(function() {
      valueEventTriggered = true;
    });

    ref.on('child_added', function(snapshot) {
      if (!valueEventTriggered) { return; }
      adapter._handleChildValue(store, type, serializer, snapshot);
    });

    ref.on('child_changed', function(snapshot) {
      if (!valueEventTriggered) { return; }
      adapter._handleChildValue(store, type, serializer, snapshot);
    });

    ref.on('child_removed', function(snapshot) {
      if (!valueEventTriggered) { return; }
      snapshot.ref().once('value', function (snapshot) {
        if (snapshot.val() === null) {
          var record = store.getById(type, snapshot.key());
          if (record && !record.get('isDeleted')) {
            adapter._enqueue(function() {
              store.deleteRecord(record);
            });
          }
        }
      });
    });

    return deferred;
  }
});
