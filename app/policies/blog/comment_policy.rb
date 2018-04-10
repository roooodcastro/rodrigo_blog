# frozen_string_literal: true

module Blog
  class CommentPolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      true
    end

    def update?
      false
    end

    def destroy?
      user&.admin?
    end
  end
end
