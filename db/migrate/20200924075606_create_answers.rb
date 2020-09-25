class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false

      t.timestamps
    end

    add_reference :answers, :question, null: false, foreign_key: true
  end
end
