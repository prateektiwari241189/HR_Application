class CreateBooks < ActiveRecord::Migration[5.0]
  def up
    drop_table :books 

    end
  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
