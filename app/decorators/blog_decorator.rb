class BlogDecorator < BaseDecorator
  def all_tags
    Blog::Tag.ordered_by_name
  end

  def recent_articles
    articles = Blog::Article.published.order_by_published.limit(5)
                 .map { |a| a.decorate(view) }
    articles.group_by { |art| art.published_at.strftime('%B, %Y') }
  end

  def related_articles(article)
    Blog::Article.related_to(article).except(article.object)
  end
end
