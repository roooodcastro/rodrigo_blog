# frozen_string_literal: true

class User < ApplicationRecord
  include Decoratable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  validates :name, presence: true

  has_many :articles, foreign_key: 'author_id', class_name: 'Blog::Article'
  has_many :comments, class_name: 'Blog::Comment'

  def first_name
    name.split.first
  end
end
