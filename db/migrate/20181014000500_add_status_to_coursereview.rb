class AddStatusToCoursereview < ActiveRecord::Migration[5.1]
  def change
    add_column :coursereviews, :status, :string
  end
end
