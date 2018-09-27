class MessagesMailer < ApplicationMailer

  def send_email message, contact_email
    @message = message

    mail(
      to: contact_email,
      subject: message.subject,
      from: message.email,
      reply_to: message.email,
      sender: message.email,
      return_path: message.email
    )
  end
end
