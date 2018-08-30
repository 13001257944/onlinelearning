class CreateHomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :homeworks do |t|
      t.string :name
      t.string :file
      t.text :description
      t.integer :course_id
      
      t.timestamps
    end
  end
end
