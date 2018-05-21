class CommentsMailerPreview < ActionMailer::Preview
  def notify_author
    CommentsMailer.notify_author(Comment.last)
  end

  def notify_commenter
    CommentsMailer.notify_commenter(Comment.last)
  end
end
