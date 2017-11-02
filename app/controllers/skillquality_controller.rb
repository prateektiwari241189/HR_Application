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
        format.html { redirect_to @skillquality, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @skillquality.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
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

  # # DELETE /books/1
  # # DELETE /books/1.json
  # def destroy
  #   @book.destroy
  #   respond_to do |format|
  #     format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

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