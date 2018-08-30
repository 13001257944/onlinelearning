class CreateRegistrationsToUsersAndCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :registrations do |t|
      t.belongs_to :user, index: true
      t.belongs_to :course, index: true
      t.datetime :registration_date

    end
  end
end
