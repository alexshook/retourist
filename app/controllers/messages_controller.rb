class MessagesController < ApplicationController
  def index
  	@messages = Message.all
  end

  def new
  	@message = Message.create
  end

  def create
  	@message = Message.create
  end
end
