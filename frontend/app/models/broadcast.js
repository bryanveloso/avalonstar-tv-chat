import DS from 'ember-data';

var Broadcast = DS.Model.extend({
  number: DS.attr('number'),

  // Metadata. Dates.
  created: DS.attr('date', {
    defaultValue: function () { return new Date(); }
  }),
  length: DS.attr('string'),

  // Broadcast statuses (special, charity, etc.)
  isCharity: DS.attr('boolean'),
  isCouple: DS.attr('boolean'),
  isMarathon: DS.attr('boolean'),

  // Status. Much like Twitch's `status`, but can be used for other
  // purposes, i.e. comments or special guests.
  status: DS.attr('string'),
});

export default Broadcast;
