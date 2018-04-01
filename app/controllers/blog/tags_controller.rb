module Blog
  class TagsController < ::BlogController
    before_action :load_tag, only: [:show, :edit, :update, :destroy]
    before_action :authorize_action

    def index
      @tags = Blog::Tag.all
      respond_to do |format|
        format.html
        format.json { render json: @tags.to_json(methods: [:article_count]) }
      end
    end

    def show
      @tag = @tag.decorate(view_context)
    end

    private

    def load_tag
      @tag = Blog::Tag.friendly.find(params[:id])
    end

    def authorize_action
      authorize(@tag || Blog::Tag, "#{params[:action]}?")
    end
  end
end
