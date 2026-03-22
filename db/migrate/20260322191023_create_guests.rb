class CreateGuests < ActiveRecord::Migration[8.1]
  def change
    create_table :guests do |t|
      t.string :full_name, null: false

      t.timestamps
    end

    add_index :guests, :full_name
  end
end
