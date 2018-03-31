module Blog
  class TagsController < ApplicationController
    def index
      @tags = Blog::Tag.all
      respond_to do |format|
        format.html
        format.json { render json: @tags.to_json(methods: [:article_count]) }
      end
    end
  end
end
