class CreateCoursetextbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :coursetextbooks do |t|
      t.string :title
      t.text :body
      t.integer :course_id

      t.timestamps
    end
  end
end
