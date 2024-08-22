# Movies Model
class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
  # validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  private

  def check_for_bookmarks
    return unless bookmarks.any? # Si aucun bookmark n'est présent, la suppression est autorisée.

    errors.add(:base, 'Cannot delete a movie with bookmarks.')
    throw :abort
  end
end
