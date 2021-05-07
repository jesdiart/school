class CreateResults < ActiveRecord::Migration[6.1]
  def change
    create_table :results do |t|
      t.references :test, null: false, foreign_key: true
      t.integer :student_id, null: false
      t.integer :teacher_id, null: false
      t.float :mark

      t.timestamps
    end
  end
end
