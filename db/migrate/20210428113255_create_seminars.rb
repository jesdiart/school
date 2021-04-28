class CreateSeminars < ActiveRecord::Migration[6.1]
  def change
    create_table :seminars do |t|
      t.references :subject, null: false, foreign_key: true
      t.integer :teacher_id, null: false

      t.timestamps
    end
  end
end
