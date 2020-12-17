class CreateTestPassages < ActiveRecord::Migration[6.0]
  def change
    create_table :test_passages do |t|
      t.references :user, null: false, foreign_key: true
      t.references :test, null: false, foreign_key: true
      t.references :current_question, foreign_key: { to_table: :questions }, default: nil
      t.integer :correct_questions, default: 0
      t.integer :result
      t.boolean :completed

      t.timestamps
    end
  end
end
