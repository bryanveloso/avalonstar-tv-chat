`import Ember from 'ember'`
`import config from 'avalonstar/config/environment'`

DonationRoute = Ember.Route.extend
  init: ->
    source = new EventSource("https://imraising.tv/api/v1/listen?apikey=#{config.IMR_KEY}")
    source.addEventListener 'donation.add', (d) ->
      console.log JSON.parse(d.data)
      $(".donation-sound").get(0).play()

`export default DonationRoute`
