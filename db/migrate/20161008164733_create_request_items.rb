class CreateRequestItems < ActiveRecord::Migration[5.0]
  def change
    create_table :request_items do |t|
    	t.integer :item_id
    	t.integer :photo_id
    	t.integer :asker_id
      t.index :item_id
      t.index	:photo_id
      t.index :asker_id
      t.timestamps
    end
  end
end
