/**
* Viewer.js
*
* @description :: Represents a viewer that has visited the channel.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

var Viewer = {
  attributes: {
    handle: 'string',

    // Metadata. Dates.
    created: 'date',
    updated: 'date',

    // Viewer statuses (turbo, staff, etc.)
    isModerator: 'boolean',
    isStaff: 'boolean',
    isSubscriber: 'boolean',
    isTurbo: 'boolean',

    // Emoticon set.
    emoticons: 'array',

    // Relation for every broadcast a viewer has chatted in.
    broadcasts: { collection: 'Broadcast', via: 'id' }
  }
};

module.exports = Viewer;
