class RemoveTestIdFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :test_id, :integer
  end
end
