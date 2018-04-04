module Blog
  class TagsController < ::BlogController
    before_action :load_tag, only: [:show, :edit, :update, :destroy]
    before_action :authorize_action

    def index
      @tags = Blog::Tag.ordered_by_name.with_article_tags
      respond_to do |format|
        format.html
        format.json { render json: @tags.to_json(methods: [:article_count]) }
      end
    end

    def show
      @tag = @tag.decorate(view_context)
    end

    def edit
    end

    def update
    end

    def destroy
      @tag.destroy
      redirect_to blog_tags_path, notice: 'Tag was successfully destroyed!'
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
