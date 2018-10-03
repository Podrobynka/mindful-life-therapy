# Preview all emails at http://localhost:3000/rails/mailers/messages_mailer
class MessagesMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/messages_mailer/send_email
  def send_email
    MessagesMailer.send_email 'stephen', 'stephen@example.com', 'hi zoe', 'i would like to sign up for your mindfulness course'
  end

end
