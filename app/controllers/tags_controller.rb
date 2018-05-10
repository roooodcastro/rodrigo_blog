class TagsController < BaseBlogController
  before_action :load_tag, only: [:show, :edit, :update, :destroy]
  before_action :authorize_action

  def index
    @tags = Tag.ordered_by_name.with_article_tags
    @tags = Tag.ordered_by_name.with_article_tags
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
    redirect_to tags_path, notice: 'Tag was successfully destroyed!'
  end

  private

  def load_tag
    @tag = Tag.friendly.find(params[:id])
  end

  def authorize_action
    authorize(@tag || Tag, "#{params[:action]}?")
  end
end
