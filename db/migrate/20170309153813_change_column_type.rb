class ChangeColumnType < ActiveRecord::Migration[5.0]
  def up
  	change_column :managers, :email, :string
  	change_column :employees, :email, :string
  	change_column :hrs, :email, :string
  end

  def down
  	
  end
end
