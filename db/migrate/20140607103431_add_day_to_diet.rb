class AddDayToDiet < ActiveRecord::Migration
  def self.up
	add_column :diets, :day, :date
  end
end
