class MessagesMailer < ApplicationMailer

  def send_email name, email, subject, body
    @name, @email, @subject, @body = name, email, subject, body

    mail subject: @subject, from: @email, reply_to: @email, sender: @email, return_path: @email
  end
end
