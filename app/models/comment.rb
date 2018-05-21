# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user, required: false
  belongs_to :commentable, polymorphic: true
  belongs_to :article, foreign_key: 'commentable_id',
             foreign_type: 'Article', required: false
  belongs_to :parent, foreign_key: 'commentable_id',
             foreign_type: 'Comment', required: false, class_name: 'Comment'

  has_many :replies, as: :commentable, class_name: 'Comment',
           dependent: :destroy

  before_validation :pull_user_info_from_user

  validates :user_name, presence: true
  validates :body, length: { maximum: 500 }

  scope :order_by_recents, -> { order created_at: :desc }
  scope :with_second_level_replies, -> { includes replies: :replies }

  def original_article
    article || parent.original_article
  end

  private

  def pull_user_info_from_user
    return unless user
    self.user_name = user.name
    self.user_email = user.email
  end
end
