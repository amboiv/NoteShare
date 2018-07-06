class EducationProgramsController < ApplicationController
  before_action :set_education_program, only: [:show, :edit, :update, :destroy]

  # GET /education_programs
  # GET /education_programs.json
  def index
    @education_programs = EducationProgram.all
  end

  # GET /education_programs/1
  # GET /education_programs/1.json
  def show
  end

  # GET /education_programs/new
  def new
    @education_program = EducationProgram.new
  end

  # GET /education_programs/1/edit
  def edit
  end

  # POST /education_programs
  # POST /education_programs.json
  def create
    @education_program = EducationProgram.new(education_program_params)

    respond_to do |format|
      if @education_program.save
        format.html { redirect_to @education_program, notice: 'Education program was successfully created.' }
        format.json { render :show, status: :created, location: @education_program }
      else
        format.html { render :new }
        format.json { render json: @education_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /education_programs/1
  # PATCH/PUT /education_programs/1.json
  def update
    respond_to do |format|
      if @education_program.update(education_program_params)
        format.html { redirect_to @education_program, notice: 'Education program was successfully updated.' }
        format.json { render :show, status: :ok, location: @education_program }
      else
        format.html { render :edit }
        format.json { render json: @education_program.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /education_programs/1
  # DELETE /education_programs/1.json
  def destroy
    @education_program.destroy
    respond_to do |format|
      format.html { redirect_to education_programs_url, notice: 'Education program was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_education_program
      @education_program = EducationProgram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def education_program_params
      params.require(:education_program).permit(:title)
    end
end
