class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
  	@message = Message.new
    @users = User.all
  end

  def create
    @message = Message.new message_params
  	if @message.save
  		flash[:notice] = "Message sent!"
  		redirect_to user_message_path(current_user, @message)
  	else
  		render :new
  	end
  end

  def show
  	@message = Message.find params[:id]
  end

  # def messaging(other_user)
  #   messages.find_by(:sender_id)
  # end

  # def messaged(other_user)
  #   message.new(:recipient_id)
  # end

  private

  def message_params
    params.require(:message).permit(:sender_id, :recipient_id, :subject, :message_content)
  end
end