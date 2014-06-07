class AddUserToDiet < ActiveRecord::Migration
    def self.up
		add_column :diets, :user_id, :integer
    end
end
