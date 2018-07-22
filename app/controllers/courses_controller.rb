class CoursesController < ApplicationController
    before_action :set_course, only: [:show, :edit, :update, :destroy]
    layout "courses"

    access all: [:show, :index], user: { except: [:destroy, :new, :create, :edit, :update] },
          instructor: :all

    def index
        @courses = Course.by_position
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
        @course = Course.find(params[:id])  
    end

    def course_params
        params.require(:course).permit(
            :name, 
            :code, 
            :credits, 
            :description,
            :thumbnail
        )
    end

end
