class UserTest < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name:'Question',
             foreign_key: :current_question_id, optional: true

  #before_validation :before_validation_set_first_question, on: :create
  before_save :before_save_set_next_question

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
    end

    #self.current_question = next_question
    save!
  end

  private

  #def before_validation_set_first_question
  #  self.current_question = test.questions.first if test.present?
  #end

  def correct_answers
    current_question.answers.correct
  end

  def correct_answer?(answer_ids)
    correct_answers_count = correct_answers.count
    (correct_answers_count == correct_answers.where(id: answer_ids).count) &&
    (correct_answers_count == answer_ids.count)
  end

  def before_save_set_next_question
    current_id = current_question ? current_question.id : 0
    next_question = test.questions.order(:id).where('id > :id', id: current_id).first
    self.current_question = next_question
  end
end
