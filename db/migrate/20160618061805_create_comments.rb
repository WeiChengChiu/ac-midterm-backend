class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|

    	t.text :name
      t.timestamps null: false
    end
    add_column :comments, :event_id, :integer
    add_index :comments, :event_id
  end
end
