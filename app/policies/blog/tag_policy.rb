# frozen_string_literal: true

module Blog
  class TagPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      user&.poster? || user&.admin?
    end

    def update?
      user&.admin?
    end

    def destroy?
      user&.admin?
    end
  end
end
