class ApplicationMailer < ActionMailer::Base
  default from: "no-replay@courseonrails.com"
  layout "mailer/application"
end
