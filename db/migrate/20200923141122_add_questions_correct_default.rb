class AddQuestionsCorrectDefault < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:questions, :correct, from: nil, to: false)
  end
end
