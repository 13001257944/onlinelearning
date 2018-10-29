class CreateGrades < ActiveRecord::Migration[5.1]
  def change
    create_table :grades do |t|
      t.text :score
      t.integer :studenthomework_id
      t.timestamps
    end
  end
end
