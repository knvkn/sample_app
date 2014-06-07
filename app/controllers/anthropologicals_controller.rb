class AnthropologicalsController < ApplicationController
	before_filter :setup_day
	
	def index
		@message = current_user.anthropologicals.where("day = ?", @day)
		@anthropological = Anthropological.new
		@previous_item = current_user.anthropologicals.where("day < ?", @day).order(:day).last
		@next_item = current_user.anthropologicals.where("day > ?", @day).order(:day).first
	end
	
	def show
	end
  
	def new
		@anthropological = Anthropological.new
	end
	
	def create
		if Date.today == @last_date
			redirect_to :action => "index"
		else
			@anthropological = Anthropological.new(anthropological_params)
			if @anthropological.save
				redirect_to :action => "index", :date => @anthropological.day
			else
				render 'new'
			end
			
		end
	end
	
protected
	def anthropological_params
      tr_params = params.require(:anthropological).permit(:neck, :pecs, :arms, :waistline, :thigh, :triceps_surae, :weight) 
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
		
		if current_user.anthropologicals.exists?
			@last_date = current_user.anthropologicals.last.day
		else
			@last_date = 0
		end
	end
end