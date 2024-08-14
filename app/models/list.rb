class List < ApplicationRecord
  has_many :reviews
  has_many :bookmarks
  has_many :movies, through: :bookmarks, dependent: :destroy
  has_one_attached :poster

  validates :name, presence: true, uniqueness: true
end
