# frozen_string_literal: true

class User < ApplicationRecord
  include Decoratable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :trackable, :validatable

  validates :name, presence: true

  has_many :articles, foreign_key: 'author_id', class_name: 'Blog::Article'
end
