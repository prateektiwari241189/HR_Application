class Employees < ActiveRecord::Migration[5.0]
  def self.up
      create_table :employees do |t|
         t.column :name, :string, :limit => 32, :null => false
         t.column :email, :float
         t.column :password, :string, :limit => 32, :null => false
         t.column :confirm_password, :string, :limit => 32, :null => false
         t.column :department_id, :integer
		   t.column :department, :string
         t.column :description, :text
         t.column :created_at, :timestamp
      end
   end

   def self.down
      drop_table :employees
   end
end
