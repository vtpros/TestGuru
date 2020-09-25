class AddCategoryToTests < ActiveRecord::Migration[6.0]
  def change
    add_reference :tests, :category, null: false, foreign_key: true
  end
end
