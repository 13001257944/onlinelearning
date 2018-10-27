class CreateShareLearns < ActiveRecord::Migration[5.1]
  def change
    create_table :share_learns do |t|
      t.integer :user_id
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end