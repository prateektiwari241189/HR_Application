class ManagerController < ApplicationController

	def list
      @managers = Manager.all
	end

   def show
      @manager = Manager.find(params[:id])
   end
  
   def new
      @manager = Manager.new
      @department = Department.all
   end

   def manager_params
      params.require(:managers).permit(:name, :email,:password, :confirm_password, :department_id, :department)
   end

   def create
      @manager = Manager.new(manager_params)

      if @manager.save
         redirect_to :action => 'list'
      else
         @department = Department.all
         render :action => 'new'
      end
   end
end
