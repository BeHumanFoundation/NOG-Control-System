class AddLessonToSubject < ActiveRecord::Migration
  def change
    add_column :lessons,:subject_id,:integer
  end
end
