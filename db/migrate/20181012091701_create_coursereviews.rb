class CreateCoursereviews < ActiveRecord::Migration[5.1]
  def change
    create_table :coursereviews do |t|
      t.integer :user_id
      t.integer :course_id
      t.text :review
      t.string :course_helpful
      t.string :course_easy
      t.string :course_learn
      t.string :cmap_helpful
      t.string :cmap_read
      t.string :cmap_learn
      t.string :studenthomework_helpful
      t.string :studentnote_helpful
      t.string :studentreview_helpful
      t.string :system_interface_easy
      t.string :onlinelearning_heipful
      t.string :system_function
      t.string :system_easyuse
      t.string :system_friend_interact
      t.string :system_friend_relationship
      t.string :system_overall
      t.timestamps
    end
  end
end
