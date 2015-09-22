class AddStudentToLesson < ActiveRecord::Migration
  def change
    add_column :lessons, :student_id , :integer
  end
end
