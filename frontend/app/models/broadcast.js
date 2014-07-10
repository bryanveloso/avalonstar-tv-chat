import DS from 'ember-data';

var Broadcast = DS.Model.extend({
  number: DS.attr('number'),

  // Metadata. Dates.
  created: DS.attr('date', {
    defaultValue: function () { return new Date(); }
  }),
  length: DS.attr('string'),

});

export default Broadcast;
