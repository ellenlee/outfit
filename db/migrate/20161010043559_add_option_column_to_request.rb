class AddOptionColumnToRequest < ActiveRecord::Migration[5.0]
  def change
  	add_column :requests, :option_id, :integer
  	add_index  :requests, :option_id
  end
end
