module Blog
  class CommentsController < BlogController
    before_action :load_comment, only: [:update, :destroy]
    before_action :authorize_action

    def create
      @comment = current_user.comments.create(comment_params) if signed_in?
      @comment ||= Blog::Comment.create(comment_params)
      flash[:notice] = t('blog.comments.created')
      redirect_back fallback_location: @comment.article || blog_articles_path
    end

    def update

    end

    def destroy
      @comment.destroy
      flash[:notice] = t('blog.comments.destroyed')
      redirect_back fallback_location: @comment.article || blog_articles_path
    end

    private

    def comment_params
      params.require(:blog_comment).permit(:body, :user_name, :user_email,
                                           :commentable_type, :commentable_id)
    end

    def load_comment
      @comment = Blog::Comment.find(params[:id])
    end

    def authorize_action
      authorize(@comment || Blog::Comment, "#{params[:action]}?")
    end
  end
end
