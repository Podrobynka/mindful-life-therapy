class MessagesMailer < ApplicationMailer

  def send_email message, contact_email
    # incoming message will be json format
    # because active job does not accept
    # an unpersisted active model as an argument
    @message = JSON.parse(message)

    mail(
      to: contact_email,
      subject: @message['subject'],
      from: @message['email'],
      reply_to: @message['email'],
      sender: @message['email'],
      return_path: @message['email']
    )
  end
end
