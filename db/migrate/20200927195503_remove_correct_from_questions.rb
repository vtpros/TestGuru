class RemoveCorrectFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :correct, :boolean
  end
end
