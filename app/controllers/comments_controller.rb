# frozen_string_literal: true

class CommentsController < BaseBlogController
  before_action :load_comment, only: [:update, :destroy]
  before_action :authorize_action

  def create
    @comment = current_user.comments.create(comment_params) if signed_in?
    @comment ||= Comment.create(comment_params)
    send_emails
    flash[:notice] = t('comments.created')
    redirect_back fallback_location: @comment.original_article || articles_path
  end

  def update; end

  def destroy
    @comment.destroy
    flash[:notice] = t('comments.destroyed')
    redirect_back fallback_location: @comment.article || articles_path
  end

  private

  def send_emails
    CommentsMailer.notify_author(@comment).deliver_later
    return unless @comment.parent && @comment.parent.user_email.present?
    CommentsMailer.notify_commenter(@comment).deliver_later
  end

  def comment_params
    params.require(:comment).permit(:body, :user_name, :user_email,
                                    :commentable_type, :commentable_id)
  end

  def load_comment
    @comment = Comment.find(params[:id])
  end

  def authorize_action
    authorize(@comment || Comment, "#{params[:action]}?")
  end
end
