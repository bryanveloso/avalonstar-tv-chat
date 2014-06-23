/**
* Messages.js
*
* @description :: Represents a message sent via IRC.
* @docs        :: http://sailsjs.org/#!documentation/models
*/

var Message = {
  adapter: 'tmi',
  attributes: {
    from: 'string',
    to: 'string',
    message: 'string'
  }
};

module.exports = Message;
