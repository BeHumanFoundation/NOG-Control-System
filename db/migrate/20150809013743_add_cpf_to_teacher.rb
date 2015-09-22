class AddCpfToTeacher < ActiveRecord::Migration
  def change
    add_column :teachers, :cpf, :string
    add_column :teachers, :phone, :string
    add_column :teachers, :address, :string
    add_column :teachers, :cep, :string
    add_column :teachers, :profession, :string
    add_column :teachers, :birthday, :date
  end
end
