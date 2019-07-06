jQuery(document).on 'turbolinks:load', ->
  $messages = $('#messages')
  $new_message_form = $('#new-message')
  $new_message_body = $new_message_form.find('#message-body')

  if $messages.length > 0
    App.chat = App.cable.subscriptions.create {
      channel: "ChatChannel"
      },
      connected: ->

      disconnected: ->

      received: (data) ->
        if data['message']
          $new_message_body.val('')
          sender_id = $(data['message']).find('.messageids').data 'sender-id'
          logged_id = $('.logged-user').data 'logged-user'
          $messages.append data['message']
          $content = $messages.find(".message").last().find('.messsage-content')
          if sender_id == logged_id
            $content.css 'text-align', 'right'
          else
            $content.css 'text-align', 'left'
            
      send_message: (message) ->
        @perform 'send_message', message: message
