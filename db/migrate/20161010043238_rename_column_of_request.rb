class RenameColumnOfRequest < ActiveRecord::Migration[5.0]
  def change
  	rename_column :requests, :user_id, :asker_id
  	rename_index :requests, :user_id, :asker_id
  end
end
