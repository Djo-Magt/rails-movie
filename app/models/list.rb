class List < ApplicationRecord
  has_many :favoris, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :movies, through: :favoris

  validates :name, presence: true, uniqueness: true

end
