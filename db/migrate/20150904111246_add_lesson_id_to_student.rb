class AddLessonIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :lesson_id,:integer
  end
end
