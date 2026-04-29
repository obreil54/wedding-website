class CreateRsvps < ActiveRecord::Migration[8.1]
  def change
    create_table :rsvps do |t|
      t.references :guest, null: false, foreign_key: true
      t.string :email
      t.boolean :attending, null: false
      t.boolean :event_1_attending
      t.boolean :event_2_attending
      t.boolean :event_3_attending
      t.text :dietary_requirements
      t.text :notes

      t.timestamps
    end
  end
end
