class UserController < ApplicationController

	def list
      @user = User.all
	end

   def show
      @user = User.find(params[:id])
   end
  
   def new
      @user = User.new
   end
   
   def user_params
      params.require(:users).permit(:email, :password, :confirm_password)
   end

   def create
      @user = User.new(user_params)
	
		if @user.save
			redirect_to :action => 'list'
		else
			render :action => 'new'
		end
   end
end
