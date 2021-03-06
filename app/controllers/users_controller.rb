class UsersController < ApplicationController
before_filter :setup_day
before_action :signed_in_user, only: [:index, :edit, :update]
before_action :correct_user,   only: [:edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def edit
  end
  
  	def setup_day
	
		if params[:date].nil?
			@day = Date.today
		else
			@day = Date.parse(params[:date])
		end
		if signed_in?
			if current_user.anthropologicals.exists?
				@last_weight = current_user.anthropologicals.last.weight
			else
				@last_weight = 0
			end
		end	
	end

  private

  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end
  
  def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
  end
	
  def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
  end

  def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
  end
	
end
