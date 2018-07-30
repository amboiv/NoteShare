class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :toggle_status]
  #include SetCurrentCourse
  layout "notes"

  access student: :all, instructor: :all

  # GET /notes
  # GET /notes.json
  def index
    @page_title = "NoteShare | Notes"
    # if check_course
      @course = Course.friendly.find(params[:course_id])
      @notes = Note.where(course_id: @course.id).paginate_notes(params[:page])
      @lectures = Lecture.where(course_id: @course)
    # else
    #   redirect_to my_notes_path
    # end
  end

  def my_notes
    @notes = Note.where(user_id: current_user.id).paginate_notes(params[:page])
  end

  def not_commentable
    @not_commentable_notes = Note.not_commentable
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @note = Note.includes(:comments).friendly.find(params[:id])
    @comment = Comment.new

    @page_title = @note.title
    @seo_keywords = @note.body
  end

  # GET /notes/new
  def new
    if check_course
      @note = Note.new
      @course = Course.find_by(slug: params[:course_id])
      #@course_id = Course.find_by(slug: params[:course_id]).id
    else
      redirect_to courses_path, notice: 'Please select a course for your note.'
    end
  end

  # GET /notes/1/edit
  def edit
    @course = @note.course
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to course_notes_path(params[:course_id]), notice: 'Note was successfully created.' }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1
  # PATCH/PUT /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to my_notes_path, notice: 'Note was successfully updated.' }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1
  # DELETE /notes/1.json
  def destroy
    @note.destroy
    respond_to do |format|
      format.html { redirect_to course_notes_url(@note.course.slug), notice: 'Note was successfully deleted.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @note.cannotComment? || @note.privateNote?
      @note.canComment!
    elsif @note.canComment?
      @note.cannotComment!
    end
    redirect_to course_notes_url(@note.course.slug), notice: 'Note status has been changed to: ' + @note.status
  end

  private

    def check_course
      params[:course_id].present?
      #Note.where(user_id: current_user.id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.friendly.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body, :course_id, :user_id, :lecture_id)
    end


end
