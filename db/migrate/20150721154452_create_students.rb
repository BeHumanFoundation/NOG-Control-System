class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :name
      t.string :rg
      t.string :phone
      t.string :address
      t.date :birthday
      t.string :scholarity
      t.timestamps
    end
  end
end
