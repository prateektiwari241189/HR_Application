require 'byebug'
class SessionController < ApplicationController

	def new
	
	end

  def create
  	byebug
    user = User.find_by(email: params[:session][:email])
    employee = Employee.find_by(email: params[:session][:email])
    # session[:user_id] = user.id
    # cookies[:user_name] = "priyam I love u"
    manager = Manager.find_by(email: params[:session][:email])
	if ! user.nil? 
		begin
			byebug
			if user.password == params[:session][:password]
				render 'welcome/home' 	
			else
				# Create an error message.
				render 'user/new'
			end
		rescue
			flash[:notice] = "password doesn't match or fields are empty".html_safe
			render :action => :new, :controller => session
		end
	elsif ! manager.nil?
		if manager.password == params[:session][:password]
			render 'welcome/home'
		else
			render 'user/new'
		end
	elsif ! employee.nil?
		if employee.email == params[:session][:email]
			render 'employees/single_empdetail'	
		else 
			render 'user/new'
		end
	else
		flash[:notice] = "Email and password are empty"
		render :action => :new, :controller => session
	end
    
   
  end

  def active
    render_session_status
  end


  def timeout
  	byebug
  	flash[:notice] = "Your session has been timed out"
  	rediect_to "/user/new"
  end

  

  def home_view_session
  	byebug
  	render 'session/home'

  end
  
  def show
  
  end

  def destroy
  end
end
