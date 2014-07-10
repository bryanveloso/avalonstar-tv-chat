/**
* Broadcast.js
*
* @description :: Represents a single broadcast.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

var Broadcast = {
  adapter: 'redis',
  attributes: {
    number: { type: 'integer', required: 'true' },

    // Metadata. Dates.
    created: 'date',
    length: 'string',

    // Games played.
    games: 'array',

    // Broadcast statuses (special, charity, etc.)
    isCharity: 'boolean',
    isCouple: 'boolean',
    isCoworker: 'boolean',
    isMarathon: 'boolean',

    // Status. Much like Twitch's `status`, but can be used for other
    // purposes, i.e. comments or special guests.
    status: 'string',
  }
};

module.exports = Broadcast;
