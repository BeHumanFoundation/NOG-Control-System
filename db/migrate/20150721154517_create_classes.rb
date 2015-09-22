class CreateClasses < ActiveRecord::Migration
  def change
    create_table :classes do |t|
      t.string :name
      t.timestamps
    end
  end
end
