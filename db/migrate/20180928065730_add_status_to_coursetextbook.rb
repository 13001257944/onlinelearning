class AddStatusToCoursetextbook < ActiveRecord::Migration[5.1]
  def change
    add_column :coursetextbooks, :status, :string
  end
end
