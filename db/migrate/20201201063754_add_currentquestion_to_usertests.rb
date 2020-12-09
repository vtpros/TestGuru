class AddCurrentquestionToUsertests < ActiveRecord::Migration[6.0]
  def change
    # Creates a current_question_id column and a foreign key to the questions table
    add_reference :user_tests, :current_question, foreign_key: {to_table: :questions}, default: nil
  end
end
