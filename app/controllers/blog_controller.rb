# frozen_string_literal: true

class BlogController < BaseBlogController
  def show
    @articles = Article.published.order_by_published.with_tags
                  .map { |a| a.decorate(view_context) }
  end
end
