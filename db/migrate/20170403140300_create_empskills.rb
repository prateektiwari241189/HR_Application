class CreateEmpskills < ActiveRecord::Migration[5.0]
  def change
    create_table :empskills do |t|
      t.references :employee, index: true, foreign_key: true
      t.references :skill, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
