class MessagesController < ApplicationController
  def index
    @receiver_id = params[:receiver_id]
    send_messages =  Message.where("sender_id = ? and receiver_id = ?",
                                   current_user.id, params[:receiver_id])
    receiver_message = Message.where("sender_id = ? and receiver_id = ?",
                                     params[:receiver_id], current_user.id)
    @messages = (send_messages + receiver_message).sort
  end

  def create
    @message = current_user.send_messages.create(body: params[:body], receiver_id: params['receiver_id'].to_i)
    ActionCable.server.broadcast 'chat_channel', message: render_message(@message)
  end

  private

  def render_message(message)
    render partial: 'messages/message', locals: {message: message}
  end
end
