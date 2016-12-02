class ApplicationMailer < ActionMailer::Base
  default from: 'toto@test.com'
  layout 'mailer'
end
