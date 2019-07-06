class ChatsController < ApplicationController

  def index
    @messages = Message.order(created_at: :asc)
  end
end
