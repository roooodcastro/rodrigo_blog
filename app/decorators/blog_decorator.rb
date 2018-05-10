# frozen_string_literal: true

class BlogDecorator < BaseDecorator
  def all_tags
    @all_tags ||= Tag.ordered_by_usage.limit(5)
  end

  def recent_articles
    return @recent if defined? @recent
    articles = Article.published.order_by_published.limit(5)
                 .map { |a| a.decorate(view) }
    @recent = articles.group_by { |art| art.published_at.strftime('%B, %Y') }
  end

  def related_articles(article)
    @related_articles ||= Article.related_to(article).except(article.object)
  end
end
