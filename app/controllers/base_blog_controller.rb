class BaseBlogController < ApplicationController
  layout 'blog'

  before_action :load_blog_decorator

  private

  def load_blog_decorator
    @blog = BlogDecorator.new(view_context)
  end
end
