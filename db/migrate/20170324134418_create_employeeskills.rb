class CreateEmployeeskills < ActiveRecord::Migration[5.0]
  def change
    create_table :employeeskills do |t|
    	t.integer :employee_id
    	t.integer :skill_id

      t.timestamps
    end
  end
end


YKKAF44_