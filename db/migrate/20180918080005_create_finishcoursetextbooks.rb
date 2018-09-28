class CreateFinishcoursetextbooks < ActiveRecord::Migration[5.1]
  def change
    create_table :finishcoursetextbooks do |t|
      t.integer :user_id
      t.integer :coursetextbook_id
      t.timestamps
    end
  end
end
