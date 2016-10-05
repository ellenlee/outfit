class CreateRequests < ActiveRecord::Migration[5.0]
  def change
    create_table :requests do |t|
    	t.integer :user_id
    	t.integer :photo_id
    	t.index	:user_id
    	t.index	:photo_id
      t.timestamps
    end
  end
end
