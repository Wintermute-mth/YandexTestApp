App.news_item = App.cable.subscriptions.create "NewsItemChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    el = document.getElementById("container")
    if el 
      el.innerHTML = data.message
  
  change_item: (message) ->
    @perform 'change_item', message: message