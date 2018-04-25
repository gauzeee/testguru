class ApplicationMailer < ActionMailer::Base
  default from: %{"TestGuru" <gauzeee@gmail.com>}
  layout 'mailer'
end
