class ApplicationMailer < ActionMailer::Base
  default to: Setting.first.contact_email
  
  layout 'mailer'
end
