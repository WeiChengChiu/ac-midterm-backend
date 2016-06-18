class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :topic
      t.text :description

      t.timestamps null: false
    end
  end
end
