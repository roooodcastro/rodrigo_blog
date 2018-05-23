# frozen_string_literal: true

module Blog
  class ArticlePolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      record.published? || user&.admin?
    end

    def create?
      user&.poster?
    end

    def update?
      user == record.author || user&.admin?
    end

    def destroy?
      user == record.author || user&.admin?
    end
  end
end
