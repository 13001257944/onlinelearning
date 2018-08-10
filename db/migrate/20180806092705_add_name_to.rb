class AddNameTo < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :birthday, :date
    add_column :users, :college, :string
    add_column :users, :sex, :string
    add_column :users, :ror, :string
    add_column :users, :programming, :string
  end
end
