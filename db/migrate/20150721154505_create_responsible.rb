class CreateResponsible < ActiveRecord::Migration
  def change
    create_table :responsibles do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.string :address
      t.string :cpf
      t.date :birthday
      t.timestamps
    end
  end
end
