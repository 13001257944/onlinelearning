class AddDescriptionToStudenthomeworks < ActiveRecord::Migration[5.1]
  def change
    add_column :studenthomeworks, :description, :text
  end
end
