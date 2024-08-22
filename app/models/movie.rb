class Movie < ApplicationRecord
  has_many :bookmarks, dependent: :restrict_with_error
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
end
