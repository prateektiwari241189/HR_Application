class AddConfirmPasswordToManagers < ActiveRecord::Migration[5.0]
  def change
    add_column :managers, :confirm_password, :string
  end
end
