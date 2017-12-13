class EmployeesController < ApplicationController
  require 'will_paginate/array' 
   before_action :set_employee, only: [:show, :edit]

  

   def list
    @employees = Employee.paginate(:page =>params[:page], :per_page => 10).order('created_at DESC')
  end

	# def list
 #      @employees = Employee.order('name').page(params[:page]).per_page(10)
	# end

   def show
      @employee_skill = @employee.empskill
   end
  
   def new
      byebug
      @employee = Employee.new
      get_employees
   end

   def edit
    @employee = Employee.find(params[:id])
    @all_skills = Skill.all
   end

   # def employee_params
   #    params.require(:employees).permit(:name)
   # end

   def create
      byebug
      @employee = Employee.new(employee_params)

      params[:skills][:skill_id].each do |skill|
      byebug
         if !skill.empty?
            @employee.empskill.build(:skill_id => skill)
         end
      end

      respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, :format => @user }
        format.json { render :show, status: :created, location: @employee, :format => @user }
      else
        format.html { render :employees }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
   end

   

    def update
      byebug
      @employee = Employee.find(params[:id])
      
      if @employee.update_attributes(employee_param)
        params[:employee][:skill_ids].each do |skill|
        byebug
         if !skill.empty?
            @employee.empskill.build(:skill_id => skill)
            @employee.empskill.update_all(:skill_id => skill)
         end
      end
         @employee.save
         EmployeemailerMailer.employee_email(@employee).deliver
         redirect_to :action => 'show', :id => @employee
      else
         @skills = Skill.all
         render :action => 'edit'
      end
   end
   
   def delete
      Employee.find(params[:id]).destroy
      redirect_to :action => 'list'
   end


    private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_param
      params.require(:employee).permit(:name, :id, :skill,:email,:department_id,:description, :image)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.require(:employees).permit(:name, :id, :skill,:email,:department_id,:description, :image)
    end

    # utility method

    def get_employees
      @all_skills = Skill.all
      @employee_skill = @employee.empskill
       
    end

end
