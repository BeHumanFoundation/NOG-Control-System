class AddSubjectToStudents < ActiveRecord::Migration
  def change
    add_column :students,:subject_id,:integer
  end
end
