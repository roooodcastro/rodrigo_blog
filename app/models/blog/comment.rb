module Blog
  class Comment < ApplicationRecord
    belongs_to :user, required: false
    belongs_to :commentable, polymorphic: true
    has_many :replies, as: :commentable, class_name: 'Blog::Comment'

    before_save :pull_user_info_from_user

    validates :user_name, presence: true

    private

    def pull_user_info_from_user
      return unless user
      self.user_name = user.name
      self.user_email = user.email
    end
  end
end
