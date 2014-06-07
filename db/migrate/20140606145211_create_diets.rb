class CreateDiets < ActiveRecord::Migration
  def change
    create_table :diets do |t|
      t.string :name
      t.integer :weight
      t.integer :calories

      t.timestamps
    end
  end
end
