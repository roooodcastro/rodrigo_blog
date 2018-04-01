class BlogDecorator < BaseDecorator
  def all_tags
    Blog::Tag.ordered_by_name
  end
end
