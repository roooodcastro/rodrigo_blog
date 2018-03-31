module Blog
  class ArticlePolicy < ApplicationPolicy
    def index?
      true
    end

    def show?
      true
    end

    def create?
      user == record.author
    end

    def update?
      user == record.author
    end

    def destroy?
      user == record.author
    end
  end
end
