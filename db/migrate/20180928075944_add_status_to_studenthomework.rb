class AddStatusToStudenthomework < ActiveRecord::Migration[5.1]
  def change
    add_column :studenthomeworks, :status, :string
  end
end
