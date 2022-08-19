class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_exception
  validates :title, presence: true, uniqueness: true
  validates :title, length: { minimum: 1 }
  validates :overview, presence: true
end
