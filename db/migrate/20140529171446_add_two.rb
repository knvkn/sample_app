class AddTwo < ActiveRecord::Migration
  def self.up
	add_column :user_to_trainings, :weight, :integer, :default => 0
	add_column :user_to_trainings, :count, :integer, :default => 0
  end
end
