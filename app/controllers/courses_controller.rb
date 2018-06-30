class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    # POST /notes
    # POST /notes.json
    def create
        @course = Course.new(params.require(:course).permit(:name, :code, :credits, :description))

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

end
