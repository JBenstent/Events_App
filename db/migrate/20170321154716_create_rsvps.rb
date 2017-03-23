class CreateRsvps < ActiveRecord::Migration
  def change
    create_table :rsvps do |t|
      t.references :attendee, index: true
      t.references :event, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
