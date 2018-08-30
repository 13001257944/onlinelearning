class AddNewTableCourseregist < ActiveRecord::Migration[5.1]
  def change
    create_table :courseregistions do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
