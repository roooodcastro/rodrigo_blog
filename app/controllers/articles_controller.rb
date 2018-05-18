# frozen_string_literal: true

class ArticlesController < BaseBlogController
  before_action :load_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_action

  def index
    redirect_to feed_path unless current_user&.poster?
    @articles = Article.order_by_recents.map { |a| a.decorate(view_context) }
  end

  def show
    @article = @article.decorate(view_context)
  end

  def new
    @article = current_user.articles.build
    authorize(@article, 'new?')
  end

  def edit; end

  def create
    @article = current_user.articles.build(article_params)
    authorize(@article, 'create?')

    if @article.save
      redirect_to @article, notice: 'Article was successfully created.'
    else
      render :new
    end
  end

  def update
    if @article.update(article_params)
      redirect_to @article, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path,
                notice: 'Article was successfully destroyed.'
  end

  private

  def load_article
    @article = Article.friendly.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :summary, :content, :author,
                                    :published_at, :tags_text)
  end

  def authorize_action
    authorize(@article, "#{params[:action]}?")
  end
end
