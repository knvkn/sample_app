class TrainingsController < ApplicationController
	before_filter :setup_day
	
	def index
		@message = current_user.user_to_trainings.where("day = ?", @day)
		@training = UserToTraining.new
		
		@previous_training = current_user.user_to_trainings.where("day < ?", @day).order(:day).last
		@next_training = current_user.user_to_trainings.where("day > ?", @day).order(:day).first
	end
	
	def show
	end
  
	def new
		@training = UserToTraining.new
	end
	
	def create
		@training = UserToTraining.new(user_to_training_params)
		if @training.save
			redirect_to :action => "index", :date => @training.day
		else
			render 'new'
		end
	end
	
protected
	def user_to_training_params
      tr_params = params.require(:user_to_training).permit(:training_id, :weight, :count)
	  tr_params[:day] = @day
	  tr_params[:user_id] = current_user.id
	  
	  tr_params
	end
	
	def setup_day
		if params[:date].nil?
			@day = Date.today
		else
			@day = Date.parse(params[:date])
		end
	end
	
end	
