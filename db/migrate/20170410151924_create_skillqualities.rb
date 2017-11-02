class CreateSkillqualities < ActiveRecord::Migration[5.0]
  def change
    create_table :skillqualities do |t|
      t.string :name

      t.timestamps
    end
  end
end
