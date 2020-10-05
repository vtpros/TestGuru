class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  scope :sort_by_name, -> { order(name: :asc) }

  validates :name, presence: true
end
