class CreateSeminars < ActiveRecord::Migration[6.1]
  def change
    create_table :seminars do |t|
      t.references :subject, null: false, foreign_key: true
      t.references :teacher, null: false, foreign_key: true

      t.timestamps
    end
  end
end
