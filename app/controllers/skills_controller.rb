class SkillsController < ApplicationController

	before_action :set_book, only: [:show, :edit]

  def index
    @skills = Skill.all
  end

  def show
  	byebug
    @skill_employee = @skill.empskill
  end

  # GET /books/new
  def new
    @skill = Skill.new
  end

  
  def edit
  end

  def create
    @skill = Skill.new(skill_params)

    respond_to do |format|
      if @skill.save
        format.html { redirect_to @skill, notice: 'Skill was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @skill.errors, status: :unprocessable_entity }
      end
    end
  end

  # def update
  #   respond_to do |format|
  #     if @book.update(book_params)
  #       format.html { redirect_to @book, notice: 'Book was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @book }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @book.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /books/1
  # DELETE /books/1.json
  # def destroy
  #   @book.destroy
  #   respond_to do |format|
  #     format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @skill = Skill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def skill_params
      params.require(:skill).permit(:name)
    end
end

