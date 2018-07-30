class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    layout "courses"

    access instructor: :all, student: { except: [:destroy, :new, :create, :edit, :update] }

    def index
        @courses = Course.joins(:course_education_programs).where(course_education_programs: {education_program_id: current_user.education_program_id})
    end

    def sort
        params[:order].each do |key, value|
            Course.find(value[:id]).update(position: value[:position])
        end
        render body: nil
    end

    def show
    end

    def new
        @course = Course.new
    end

    # POST /courses
    # POST /courses.json
    def create
        @course = Course.new(course_params)

        respond_to do |format|
            if @course.save
                format.html { redirect_to courses_path, notice: 'A new Course was successfully created.' }
                format.json { render :show, status: :created, location: @course }
            else
                format.html { render :new }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end

    def edit
    end

    # PATCH/PUT /courses/1
    # PATCH/PUT /courses/1.json
    def update
        respond_to do |format|
            if @course.update(course_params)
                format.html { redirect_to courses_path, notice: 'The course info was successfully updated.' }
                format.json { render :show, status: :ok, location: @course }
            else
                format.html { render :edit }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end


    # DELETE /notes/1
    # DELETE /notes/1.json
    def destroy
        @course.destroy
        respond_to do |format|
            format.html { redirect_to courses_url, notice: 'The Course was successfully deleted.' }
            format.json { head :no_content }
        end
    end

    private

    def set_course
        @course = Course.friendly.find(params[:id])  
    end

    def course_params
        params.require(:course).permit(
            :name, 
            :code, 
            :credits, 
            :description,
            :thumbnail,
            :main_image,
            :education_program_ids,
            education_programs_attributes: [:title, :_destroy]
        )
    end

end