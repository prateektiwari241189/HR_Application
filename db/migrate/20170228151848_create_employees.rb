class CreateEmployees < ActiveRecord::Migration[5.0]
 def up
    drop_table :employees

    end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
