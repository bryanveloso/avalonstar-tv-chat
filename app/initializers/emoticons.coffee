`import Ember from 'ember'`

EmoticonsInitializer =
  name: 'emoticons'
  initialize: (container, app) ->
    # Wait until all of the following promises are resolved.
    app.deferReadiness()
    store = container.lookup 'service:emoticons'

    Ember.$.getJSON 'https://www.nightdev.com/hosted/emotes.php?callback=?', (json) ->
      Ember.debug 'Loading emoticons...'

      # Get our containers ready.
      emoticon_sets = {}

      # Start processing our sets.
      id = 0
      for emoticon in json.emoticons
        regex = emoticon.regex
        if regex.indexOf("(") >= 0
          regex = regex.replace("(p|P)", "(?:p|P)")
          regex = regex.replace("(o|O)", "(?:o|O)")
          regex = regex.replace("(S|s)", "(?:S|s)")
          regex = regex.replace("(_|\\.)", "(?:_|\\.)")
        regex = "\\b#{regex}\\b" if regex.match(/^\w+$/)
        regex = new RegExp(regex, 'g')

        for image in emoticon.images
          set_id = image.emoticon_set or 'default'
          set = emoticon_sets[set_id] = emoticon_sets[set_id] or []
          image.id = id++

          set.push
            is_emoticon: true
            class: "emo-#{image.id}"
            html: " <span class=\"emo-#{image.id} emoticon\"></span> "
            regex: regex

      emoticons = json.emoticons
      store.set('store', emoticons)
      store.set('sets', emoticon_sets)

      # Continue the Application boot process.
      app.advanceReadiness()

    app.inject 'route', 'emoticons', 'service:emoticons'
    app.inject 'controller', 'emoticons', 'service:emoticons'
    app.inject 'component', 'emoticons', 'service:emoticons'

`export default EmoticonsInitializer`
