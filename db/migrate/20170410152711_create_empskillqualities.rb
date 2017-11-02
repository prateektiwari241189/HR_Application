class CreateEmpskillqualities < ActiveRecord::Migration[5.0]
  def change
    create_table :empskillqualities do |t|
       t.references :emp, index: true, foreign_key: true
      t.references :skillquality, index: true, foreign_key: true


      t.timestamps
    end
  end
end
