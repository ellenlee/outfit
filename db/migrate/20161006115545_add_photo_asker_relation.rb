class AddPhotoAskerRelation < ActiveRecord::Migration[5.0]
  def change
  	add_column :photos, :asker_id, :integer
  	add_column :askers, :ask_count, :integer, default: 0
  end
end
