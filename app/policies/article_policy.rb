# frozen_string_literal: true

class ArticlePolicy < ApplicationPolicy
  def index?
    true
  end

  def show?
    true
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
