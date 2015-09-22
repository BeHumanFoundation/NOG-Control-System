class DeletePasswordToTeacher < ActiveRecord::Migration
  def change
    remove_column :teachers, :password_digest
  end
end
