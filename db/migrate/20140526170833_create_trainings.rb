class CreateTrainings < ActiveRecord::Migration
  def change
    create_table :trainings do |t|
      t.string :name, :default => ""

      t.timestamps
    end
  end
end
