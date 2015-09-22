class CreateLesson < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :name
      t.timestamps
    end
  end
end
