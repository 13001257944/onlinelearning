class RenameBirthdayToUsers < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :birthday, :text
  end
end
