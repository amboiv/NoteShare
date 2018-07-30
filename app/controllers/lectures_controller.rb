class LecturesController < ApplicationController
  layout 'notes'
  def index
    @lectures = Lecture.all
  end

  def show
    @lecture = Lecture.friendly.find(params[:id])
    @notes = @lecture.notes.page(params[:page]).per(10).order('updated_at DESC')
  end
end
