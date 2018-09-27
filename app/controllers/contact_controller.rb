class ContactController < ApplicationController
  # skip_before_action :login_required
  before_action :setup_seo

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

  def setup_seo
    @title = t 'seo.title.contact'
    @meta_description = t 'seo.meta_description.contact'
    @canonical_url = contact_url secure: true
  end

  def message_params
    params.require(:message).permit(:name, :email, :subject, :body)
  end
end
