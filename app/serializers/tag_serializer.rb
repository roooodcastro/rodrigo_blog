# frozen_string_literal: true

class TagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :article_count
end
