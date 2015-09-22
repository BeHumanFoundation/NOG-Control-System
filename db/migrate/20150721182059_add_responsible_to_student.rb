class AddResponsibleToStudent < ActiveRecord::Migration
  def change
    add_column :students, :responsible_id , :integer
  end
end
