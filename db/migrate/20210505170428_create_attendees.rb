class CreateAttendees < ActiveRecord::Migration[6.1]
  def change
    create_table :attendees do |t|
      t.references :subject, null: false, foreign_key: true
      t.integer :student_id, null: false

      t.timestamps
    end
  end
end
