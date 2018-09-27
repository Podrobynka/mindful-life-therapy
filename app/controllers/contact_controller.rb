class ContactController < ApplicationController
  # skip_before_action :login_required

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      MessagesMailer.send_email(@message, @settings.contact_email).deliver
    end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :subject, :body)
  end
end
