class Answer < ApplicationRecord
  MAX_NUM_ANSWERS = 4

  belongs_to :question
  scope :correct, -> { where(correct: true) }

  validates :body, presence: true
  validates :correct, inclusion: { in: [ true, false ] }
  validate :max_answers

  def max_answers
    if self.question.answers.count > MAX_NUM_ANSWERS
      errors.add(:question, "can't have more than #{MAX_NUM_ANSWERS} answers")
    end
  end
end
