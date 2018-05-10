# frozen_string_literal: true

class TagDecorator < BaseDecorator
  def articles
    @articles ||= object.articles.order_by_recents
                    .map { |a| a.decorate(view) }
  end
end
