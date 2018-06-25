class CreateCourseusers < ActiveRecord::Migration[5.1]
  def change
    create_table :courseusers do |t|
      t.integer :user_id
      t.integer :course_id
      t.timestamps
    end
  end
end
