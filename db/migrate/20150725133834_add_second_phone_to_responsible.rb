class AddSecondPhoneToResponsible < ActiveRecord::Migration
  def change
    add_column :responsibles, :phone_job , :string
    add_column :responsibles, :profession, :string
  end
end
