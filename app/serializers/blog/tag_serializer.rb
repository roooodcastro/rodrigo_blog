class Blog::TagSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :article_count
end
