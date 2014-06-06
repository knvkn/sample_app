class CreateUserToTrainings < ActiveRecord::Migration
  def change
    create_table :user_to_trainings do |t|
      t.integer :user_id
      t.integer :training_id
      t.date :day

      t.timestamps
    end
  end
end
