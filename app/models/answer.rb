class Answer < ApplicationRecord
  MAX_NUM_ANSWERS = 4
  
  belongs_to :question

  validates :body, presence: true
  validates :correct, inclusion: { in: [ true, false ] }
  validate :max_answers, on: :create

  scope :correct, -> { where(correct: true) }

  def max_answers
    if self.question.answers.count >= MAX_NUM_ANSWERS
      errors.add(:question, "can't have more than #{MAX_NUM_ANSWERS} answers")
    end
  end
end
