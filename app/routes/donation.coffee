`import Ember from 'ember'`

DonationRoute = Ember.Route.extend
  init: ->
    source = new EventSource("https://imraising.tv/api/v1/listen?apikey=nuZOkYmLF37yQJdzNLWLRA")
    source.addEventListener 'donation.add', (d) ->
      console.log "New donation!"
      console.log JSON.parse(d.data)

`export default DonationRoute`
