class AddCodeToCoursetextbooks < ActiveRecord::Migration[5.1]
  def change
    add_column :coursetextbooks, :code, :string
  end
end
