class Add < ActiveRecord::Migration[5.0]
  def change
  	add_column :managers, :password, :string
  end
end
