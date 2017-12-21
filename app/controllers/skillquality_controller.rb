class SkillqualityController < ApplicationController
	  before_action :set_skillquality, only: [:show, :edit]

  # GET /books
  # GET /books.json
  def index
    @skillqualities = Skillquality.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @skillquality_emp = @skillquality.empskillqualities
  end

  # GET /books/new
  def new
    @skillquality = Skillquality.new
  end

  # GET /books/1/edit
  def edit
  end

  # POST /books
  # POST /books.json
  def create
    @skillquality = Skillquality.new(skillquality_params)

    respond_to do |format|
      if @skillquality.save
        format.html { redirect_to @skillquality, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @skill }
      else
        format.html { render :new }
        format.json { render json: @skillquality.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_skillquality
      @skillquality = Skillquality.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skillquality_params
      params.require(:skillquality).permit(:name)
    end
end
