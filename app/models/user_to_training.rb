class UserToTraining < ActiveRecord::Base
	belongs_to :user
	belongs_to :training
end
