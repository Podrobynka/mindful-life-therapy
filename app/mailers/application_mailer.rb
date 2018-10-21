class ApplicationMailer < ActionMailer::Base
  default to: Setting.first.email

  layout 'mailer'
end
