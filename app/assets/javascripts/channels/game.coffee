App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    $("#result").append("<p>Connected</p>")

  disconnected: ->
    $("#result").append("<p>Disconnected</p>")

  received: (data) ->
    $("#result").append(data)
