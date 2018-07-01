class CoursesController < ApplicationController
    def index
        @courses = Course.all
    end

    def new
        @course = Course.new
    end

    # POST /courses
    # POST /courses.json
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

    def edit
        @course = Course.find(params[:id]) 
    end

    # PATCH/PUT /courses/1
    # PATCH/PUT /courses/1.json
    def update
        @course = Course.find(params[:id]) 
        respond_to do |format|
            if @course.update(params.require(:course).permit(:name, :code, :credits, :description))
                format.html { redirect_to courses_path, notice: 'The course info was successfully updated.' }
                format.json { render :show, status: :ok, location: @course }
            else
                format.html { render :edit }
                format.json { render json: @course.errors, status: :unprocessable_entity }
            end
        end
    end

end
