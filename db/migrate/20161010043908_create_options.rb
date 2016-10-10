class CreateOptions < ActiveRecord::Migration[5.0]
  def change
    create_table :options do |t|
    	t.string :name
    	t.string :description
    	t.integer	:photo_id
      t.timestamps
    end
  end
end
