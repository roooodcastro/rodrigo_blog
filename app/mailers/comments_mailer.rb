# frozen_string_literal: true

class CommentsMailer < ApplicationMailer
  def notify_author(comment)
    @comment = comment
    @article = comment.parent_article
    @author = @article.author
    mail(to: 'rod.c.azevedo@gmail.com',
         subject: notify_author_subject(@comment, @article))
  end

  def notify_commenter(comment)
    @comment = comment
    @article = comment.parent_article
    @parent = comment.parent
    mail(to: @parent.user_email,
         subject: notify_commenter_subject(@parent, @article))
  end

  private

  def notify_author_subject(comment, article)
    I18n.t('mailer.comments.author_subject', user: comment.user_name,
           article_title: article.title)
  end

  def notify_commenter_subject(comment, article)
    I18n.t('mailer.comments.commenter_subject', user: comment.user_name,
           article_title: article.title)
  end
end
