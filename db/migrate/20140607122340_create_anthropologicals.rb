class CreateAnthropologicals < ActiveRecord::Migration
  def change
    create_table :anthropologicals do |t|
      t.integer :user_id
      t.date :day
      t.integer :weight
      t.integer :neck
      t.integer :pecs
      t.integer :arms
      t.integer :waistline
      t.integer :thigh
      t.integer :triceps_surae

      t.timestamps
    end
  end
end
