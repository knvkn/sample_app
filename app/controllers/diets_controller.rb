class DietsController < ApplicationController
	before_filter :setup_day
	
	def index
		@message = current_user.diets.where("day = ?", @day)
		@diet = Diet.new
		
		@previous_item = current_user.diets.where("day < ?", @day).order(:day).last
		@next_item = current_user.diets.where("day > ?", @day).order(:day).first
	end
	
	def show
	end
  
	def new
		@diet = Diet.new
	end
	
	def create
		@diet = Diet.new(diet_params)
		if @diet.save
			redirect_to :action => "index", :date => @diet.day
		else
			render 'new'
		end
	end
	
protected
	def diet_params
      tr_params = params.require(:diet).permit(:name, :weight, :calories)
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