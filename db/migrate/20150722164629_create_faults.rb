class CreateFaults < ActiveRecord::Migration
  def change
    create_table :faults do |t|
      t.integer :lesson_id
      t.integer :student_id
      t.timestamps
    end
  end
end
