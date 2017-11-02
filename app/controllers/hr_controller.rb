class HrController < ApplicationController

	def list
      @hrs = Hr.all
	end

   def show
      @hr = Hr.find(params[:id])
   end
  
   def new
      @hr = Hr.new
      @department = Department.all
   end

   def hr_params
      params.require(:hrs).permit(:name, :email, :department_id, :department)
   end

   def create
      @hr = Hr.new(manager_params)

      if @hr.save
         redirect_to :action => 'list'
      else
         @department = Department.all
         render :action => 'new'
      end
   end
end
