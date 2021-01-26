class CreateSurvivors < ActiveRecord::Migration[6.0]
  def change
    create_table :survivors do |t|
      t.string :name, null: false
      t.integer :age, null: false
      t.string :gender, null: false

      t.timestamps
    end
  end
end

