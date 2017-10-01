if Rails.env.development? || Rails.env.production?
    ActionMailer::Base.delivery_method = :smtp
    ActionMailer::Base.smtp_settings = {
        address:        'smtp.sendgrid.net',
        port:           '2525',
        authentication: :plain,
        password:       ENV['SENDGRID_API_KEY'],
        domain:         'heroku.com',
        enable_starttls_auto: true
    }
end