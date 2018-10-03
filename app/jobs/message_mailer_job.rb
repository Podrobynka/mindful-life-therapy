class MessageMailerJob < ApplicationJob
  queue_as :default

  def perform(message, recipient)
    MessagesMailer.send_email(message, recipient).deliver_later
  end
end
