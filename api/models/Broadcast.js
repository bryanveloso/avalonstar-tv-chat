/**
* Broadcast.js
*
* @description :: Represents a single broadcast.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

var Broadcast = {
  attributes: {
    number: 'string',

    // Metadata. Dates.
    created: 'date',
    length: 'string',

    // Games played.
    games: 'array',

    // Broadcast statuses (special, charity, etc.)
    isCharity: 'boolean',
    isCouple: 'boolean',
    isMarathon: 'boolean',

    // Status. Much like Twitch's `status`, but can be used for other
    // purposes, i.e. comments or special guests.
    status: 'string',
  }
};

module.exports = Broadcast;
