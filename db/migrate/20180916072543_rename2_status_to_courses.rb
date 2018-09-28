class Rename2StatusToCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :status, :string
  end
end
