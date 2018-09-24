SMTP_SETTINGS = {
  address: ENV.fetch('SMTP_ADDRESS'),
  authentication: :plain,
  domain: ENV.fetch('SMTP_DOMAIN'),
  enable_starttls_auto: true,
  password: ENV.fetch('SENDGRID_PASSWORD'),
  port: '587',
  user_name: ENV.fetch('SENDGRID_USERNAME')
}.freeze
