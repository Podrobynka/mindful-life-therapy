class MessageMailerJob < ApplicationJob
  queue_as :default

  def perform(name, email, subject, body)    
    MessagesMailer.send_email(name, email, subject, body).deliver
  end
end
