
class WelcomeController < ApplicationController

	def home
		
	end

	def home_view
		byebug
		render 'welcome/home'
	end
end
