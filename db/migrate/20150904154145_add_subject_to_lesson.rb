class AddSubjectToLesson < ActiveRecord::Migration
  def change
      add_column :subjects, :lesson_id, :integer
  end
end
