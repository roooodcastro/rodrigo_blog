# frozen_string_literal: true

module Blog
  class BlogController < ::BlogController
    def show
      @articles = Article.published.order_by_published.with_tags
                    .map { |a| a.decorate(view_context) }
    end
  end
end
