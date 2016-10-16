class AddNoteToAsker < ActiveRecord::Migration[5.0]
  def change
    add_column :askers, :note, :string
  end
end
