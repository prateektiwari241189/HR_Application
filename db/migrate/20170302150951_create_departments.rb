class CreateDepartments < ActiveRecord::Migration[5.0]
   def self.up
      
      create_table :departments do |t|
         t.column :name, :string
      end
	
      Department.create :name => "Appian"
      Department.create :name => "Saleforce"
      Department.create :name => "Testing"
      Department.create :name => "Automation"
   end

   def self.down
      drop_table :subjects
   end
end
