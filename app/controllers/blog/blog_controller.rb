# frozen_string_literal: true

module Blog
  class BlogController < ApplicationController
    def show
      @articles = Article.published.order_by_published
                    .map { |a| a.decorate(view_context) } * 10
    end
  end
end
