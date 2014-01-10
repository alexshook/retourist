class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
  	@messages = Message.all
  end

  def new
  	@message = Message.new
  end

  def create
    @user = User.find params[:message][:recipient_id]
    current_user.send!(@user)

  	@message = Message.new message_params
  	if @message.save
  		flash[:notice] = "Message sent!"
  		redirect_to @message
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