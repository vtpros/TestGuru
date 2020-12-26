class TestPassage < ApplicationRecord
  SUCCESS_PERCENTAGE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_save :before_save_set_next_question, unless: :completed?

  scope :by_user, ->(user) { where(user: user) }

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def set_result
    # sets percentage of correctly answered questions
    self.result = (correct_questions.to_f / test.questions.count * 100).to_i
    save!
  end

  def success?
    result >= SUCCESS_PERCENTAGE
  end

  def current_question_index
    test.questions.index { |q| q.id == current_question.id } + 1
  end

  private

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    # safe navigation used in case correct answer missing in the question
    correct_answers&.ids&.sort == answer_ids.map(&:to_i).sort
  end

  def before_save_set_next_question
    current_id = current_question ? current_question.id : 0
    next_question = test.questions.order(:id).find_by('id > :id', id: current_id)
    next_question.nil? ? self.completed = true : self.current_question = next_question
  end
end
