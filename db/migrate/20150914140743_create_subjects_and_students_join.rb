class CreateSubjectsAndStudentsJoin < ActiveRecord::Migration
  def change
    create_table :subjects_and_students_joins do |t|
      t.integer :subject_id
      t.integer :student_id
    end
  end
end
