class CreateAskers < ActiveRecord::Migration[5.0]
  def change
    create_table :askers do |t|
    	t.string	:name
    	t.string  :email
    	t.index   :email, unique: true
      t.timestamps
    end
  end
end
