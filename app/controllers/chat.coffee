`import Ember from 'ember'`

Chat = Ember.ArrayController.extend
  itemController: 'chat-message'
  sortProperties: ['timestamp']

  arrangedContent: (->
    @get('content').sortBy('timestamp').slice(-30);
  ).property('content')

  # Emoticon-related methods.
  styleEmoticons: (->
    styles = ''
    images = 0

    Ember.debug 'Styling emoticons...'
    for emoticon in @get('emoticons.store')
      for image in emoticon.images
        images++
        styles += """
        .emo-#{image.id} {
          background-image: url('#{image.url}');
          width: #{image.width}px; height: #{image.height}px;
          margin-top: -#{(image.height - 18) / 2}px; }

        """

    Ember.debug "#{images} images styled."
    return "<style>#{styles}</style>"
  ).property('emoticons.store.[]')

`export default Chat`
