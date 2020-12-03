class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  #has_many :usertests

  validates :body, presence: true
end
