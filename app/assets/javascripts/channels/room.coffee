App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    $(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
      if event.keyCode is 13 # return = send
        App.room.speak event.target.value
        event.target.value = ''
        event.preventDefault()

  disconnected: ->

  received: (data) ->
    $('#messages').append data['message']

  speak: (message) ->
    @perform 'speak', message: message
