# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  include Roadie::Rails::Automatic
  default from: "from@example.com"
  layout "mailer"
end
