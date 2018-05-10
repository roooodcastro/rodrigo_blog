# frozen_string_literal: true

class ArticleTag < ApplicationRecord
  belongs_to :article
  belongs_to :tag

  validates :article, :tag, presence: true
  validates :tag, uniqueness: { scope: :article }
end
