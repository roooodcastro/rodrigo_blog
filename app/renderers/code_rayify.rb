# frozen_string_literal: true

class CodeRayify < Redcarpet::Render::HTML
  def block_code(code, language)
    CodeRay.scan(code, language).div(line_numbers: :table)
  end
end
