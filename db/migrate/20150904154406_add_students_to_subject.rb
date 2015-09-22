class AddStudentsToSubject < ActiveRecord::Migration
  def change
    add_column :subjects,:student_id,:integer
    
  end
end
