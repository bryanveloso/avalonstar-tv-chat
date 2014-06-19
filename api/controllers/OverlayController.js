/**
 * OverlayController
 *
 * @description :: Server-side logic for managing viewers
 * @help        :: See http://links.sailsjs.org/docs/controllers
 */

var OverlayController = {
  cinematic: function(req, res) {
    return res.view();
  },
  game: function(req, res) {
    return res.view();
  },
  prologue: function(req, res) {
    return res.view();
  },
}

module.exports = OverlayController;

