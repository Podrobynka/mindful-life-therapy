class ContactController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.new message_params

    if @message.valid?
      queue_email @message
    else
      render :new
    end
  end

  private

    def queue_email message
      MessageMailerJob.perform_later(message.name, message.email, message.subject, message.body)
    end

    def message_params
      params.require(:message).permit(:name, :email, :subject, :body)
    end
end
