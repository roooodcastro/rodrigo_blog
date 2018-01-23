# frozen_string_literal: true

Rails.application.config.content_security_policy do |p|
  p.default_src :self, :https
  p.font_src    :self, :https, :data
  p.img_src     :self, :https, :data
  p.object_src  :none
  p.script_src  :self, :https
  p.style_src   :self, :https, :unsafe_inline
end
