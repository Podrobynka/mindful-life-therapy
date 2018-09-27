# Preview all emails at http://localhost:3000/rails/mailers/messages_mailer
class MessagesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/messages_mailer/send_email
  def send_email
    message = Message.new name: 'awesome person', email: 'awe@some.com', subject: 'awesome subject', body: 'awesome body'
    MessagesMailer.send_email message, 'info@mindfullifetherapy.co.uk'
  end

end
