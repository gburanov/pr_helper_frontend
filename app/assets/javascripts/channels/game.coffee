App.game = App.cable.subscriptions.create "GameChannel",
  connected: ->
    $("body").append("<p>Connected</p>")

  disconnected: ->
    $("body").append("<p>Disconnected</p>")

  received: (data) ->
    alert(data)
    $("body").append(data)
