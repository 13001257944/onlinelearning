class RenameStatusToCourses < ActiveRecord::Migration[5.1]
  def change
    change_column :courses, :status, :text
  end
end
