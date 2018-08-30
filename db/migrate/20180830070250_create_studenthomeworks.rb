class CreateStudenthomeworks < ActiveRecord::Migration[5.1]
  def change
    create_table :studenthomeworks do |t|
      t.integer :user_id
      t.integer :homework_id
      t.string :file
      t.timestamps
    end
  end
end
