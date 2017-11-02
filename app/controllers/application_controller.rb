class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  add_flash_types :success, :warning, :danger, :info
  respond_to? :html, :json
  auto_session_timeout @session_time
  def session_time
  	byebug
  	@session_time = 2.minute
  end

  # before_filter :set_current_user

	

	def current_ability
  		@current_ability ||= Ability.new(current_member)
	end

	# def set_current_user
 #    byebug
 # 	 # User.current_user = current_user
	# end
end
