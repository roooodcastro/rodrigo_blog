class BlogDecorator < BaseDecorator
  def all_tags
    @all_tags ||= Blog::Tag.ordered_by_usage.limit(10)
  end

  def recent_articles
    return @recent if defined? @recent
    articles = Blog::Article.published.order_by_published.limit(5)
                 .map { |a| a.decorate(view) }
    @recent = articles.group_by { |art| art.published_at.strftime('%B, %Y') }
  end

  def related_articles(article)
    @related ||= Blog::Article.related_to(article).except(article.object)
  end
end
