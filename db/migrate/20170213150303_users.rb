class Users < ActiveRecord::Migration[5.0]
    def self.up
      create_table :users do |t|
         t.column :email, :string, :limit => 32, :null => false
		 t.column :password, :string, :limit => 32, :null => false
		 t.column :confirm_password, :string, :limit => 32, :null => false
        
      end
   end

   def self.down
      drop_table :users
	end
end
