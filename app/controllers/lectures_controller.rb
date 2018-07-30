class LecturesController < ApplicationController
  layout 'notes'
  def index
    @course = Course.friendly.find(params[:course_id])
    @lectures = Lecture.where(course_id: @course.id)
  end

  def show
    @lecture = Lecture.friendly.find(params[:id])
    @course = Course.friendly.find(params[:course_id])
    @lectures = Lecture.where(course_id: @course.id)
    @notes = @lecture.notes.page(params[:page]).per(10).order('updated_at DESC')
  end
end
