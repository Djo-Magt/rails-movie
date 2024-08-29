class Favori < ApplicationRecord
  belongs_to :movie
  belongs_to :list

  validates :text, length: { minimum: 6 }
  # validates :movie_id, uniqueness: { scope: list_id, message: 'already in the list' }
end
