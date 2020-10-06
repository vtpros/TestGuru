class Category < ApplicationRecord
  has_many :tests, dependent: :destroy

  validates :name, presence: true

  default_scope { order(name: :asc) }
end
