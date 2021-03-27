class Comment < ApplicationRecord
  has_many :user
  has_many :prototype

  validates :text, presence: true
end
