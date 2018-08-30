class AddFileloadColumnsToHomeworks < ActiveRecord::Migration[5.1]
  def up
    add_attachment :homeworks, :fileload
  end

  def down
    remove_attachment :homeworks, :fileload
  end
end
