# frozen_string_literal: true

module ApplicationHelper
  def gravatar_url_for(email)
    md5 = Digest::MD5.hexdigest(email.to_s)
    "https://www.gravatar.com/avatar/#{md5}?default=identicon"
  end
end
