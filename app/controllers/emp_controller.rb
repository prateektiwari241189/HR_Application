class EmpController < ApplicationController
  before_action :set_emp, only: [:show, :edit]

  # GET /authors
  # GET /authors.json
  def index
    @emps = Emp.all
  end

  # GET /authors/1
  # GET /authors/1.json
  def show
    @empskillqualities = @emp.empskillqualities
  end

  # GET /authors/new
  def new
    @emp = Emp.new
    get_skillquality
  end

  # GET /authors/1/edit
  def edit
    get_books
  end

  # POST /authors
  # POST /authors.json
  def create
    @emp = Emp.new(emp_params)

    params[:skillqualities][:id].each do |skillquality|
      if !skillquality.empty?
        @emp.skillqualities.build(:skillquality_id => skillquality)
      end
    end

    respond_to do |format|
      if @emp.save
        format.html { redirect_to @emp, notice: 'Author was successfully created.' }
        format.json { render :show, status: :created, location: @emp }
      else
        format.html { render :new }
        format.json { render json: @emp.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /authors/1
  # PATCH/PUT /authors/1.json
  # def update
  #   respond_to do |format|
  #     if @author.update(author_params)
  #       # http://guides.rubyonrails.org/association_basics.html
  #       @author.books = []
  #       params[:books][:id].each do |book|
  #         if !book.empty?
  #           @author.books << Book.find(book)
  #         end
  #       end
  #       format.html { redirect_to @author, notice: 'Author was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @author }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @emp.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /authors/1
  # DELETE /authors/1.json
  # def destroy
  #   @emp.destroy
  #   respond_to do |format|
  #     format.html { redirect_to authors_url, notice: 'Author was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_emp
      @emp = Emp.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def emp_params
      params.require(:emp).permit(:name)
    end

    # Utility methods
    def get_skillquality
      @all_skills = Skillqualiyt.all
      @emp_skillquality = @emp.empskillqualities.build
    end
end
