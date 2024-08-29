class Movie < ApplicationRecord
  has_many :favoris
  has_many :lists, through: :favoris

  validates :title, presence: true, uniqueness: true
  validates :resume, presence: true
end
