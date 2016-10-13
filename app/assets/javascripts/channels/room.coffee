App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    
    # alert data.content
    
    # unless data.content.blank?
    #   # submit_message(data)
    #   # $('#messages-table').append '<div class="message">' + '<div class="message-user">' + data.username + ":" + '</div>' +
    #   #     '<div class="message-content">' + data.content + '</div>' + '</div>'
    #   $('#messages-table').append data.message
    #   scroll_bottom()
    
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()
    
$(document).on 'turbolinks:load', ->
  submit_message()
  scroll_bottom()

submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      console.log("enter key was pressed. We watchin' you!")
      $('input').click()
      clear_input()
      event.preventDefault()
    
  # $('input').click ->
  #   clear_input()

clear_input = () ->
  event.target.value = ""

scroll_bottom = () ->
  $('#messages').scrollTop($('#messages')[0].scrollHeight)