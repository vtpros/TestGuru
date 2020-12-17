class AddAuthorToTests < ActiveRecord::Migration[6.0]
  def change
    # Creates an author_id column and a foreign key to the tests table
    add_reference :tests, :author, null: false, foreign_key: { to_table: :users }
  end
end
