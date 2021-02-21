class RenameHashToGistHash < ActiveRecord::Migration[6.0]
  def change
    rename_column :gists, :hash, :gist_hash
  end
end
