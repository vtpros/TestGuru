class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy

  validates :body, presence: true
  validate :number_of_answers, on: :save

  def number_of_answers
    unless (1..4).include?(answers.count)
      errors.add(:answers, "should be 1 to 4")
    end
  end
end
