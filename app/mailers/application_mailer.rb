class ApplicationMailer < ActionMailer::Base
  default from: "Mindful Life Therapy <no-reply@mindfullifetherapy.co.uk>",
          reply_to: 'no-reply@mindfullifetherapy.co.uk',
          sender: 'no-reply@mindfullifetherapy.co.uk',
          return_path: 'no-reply@mindfullifetherapy.co.uk'

  layout 'mailer'
end
