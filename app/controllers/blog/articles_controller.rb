module Blog
  class ArticlesController < ApplicationController
    before_action :load_article, only: [:show, :edit, :update, :destroy]

    def index
      @articles = Article.all
    end

    def show
      @article = @article.decorate(view_context)
    end

    def new
      @article = current_user.articles.build
    end

    def edit
    end

    def create
      @article = current_user.articles.build(article_params)

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
      redirect_to articles_url, notice: 'Article was successfully destroyed.'
    end

    private

    def load_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:blog_article).permit(:title, :summary, :content, :author)
    end
  end
end