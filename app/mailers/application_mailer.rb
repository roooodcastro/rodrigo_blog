# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: "#{I18n.t(:blog_title)} <no-reply@rooood.com>"
  layout 'mailer'
end
