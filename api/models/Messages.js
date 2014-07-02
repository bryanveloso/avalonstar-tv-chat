/**
* Messages.js
*
* @description :: Represents a message sent via IRC.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

var Message = {
  adapter: ['redis', 'tmi'],
  attributes: {
    from: { type: 'string', required: true },
    to: { type: 'string', required: true },
    message: { type: 'string', required: true },
    type: { type: 'string', required: true }
  }
};

module.exports = Message;
