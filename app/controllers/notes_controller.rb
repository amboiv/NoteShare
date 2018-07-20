class NotesController < ApplicationController
  before_action :set_note, only: [:show, :edit, :update, :destroy, :toggle_status]
  layout "notes"

  access all: [:show, :index], user: { except: [:destroy, :new, :create, :edit, :update, :toggle_status] },
          student: :all, instructor: :all

  # GET /notes
  # GET /notes.json
  def index
    @page_title = "NoteShare | Notes"
    @notes = Note.all
  end

  def not_commentable
    @not_commentable_notes = Note.not_commentable
  end

  # GET /notes/1
  # GET /notes/1.json
  def show
    @page_title = @note.title
    @seo_keywords = @note.body
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
  end

  # POST /notes
  # POST /notes.json
  def create
    @note = Note.new(note_params)

    respond_to do |format|
      if @note.save
        format.html { redirect_to @note, notice: 'Note was successfully created.' }
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
        format.html { redirect_to @note, notice: 'Note was successfully updated.' }
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
      format.html { redirect_to notes_url, notice: 'Note was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def toggle_status
    if @note.cannotComment? || @note.privateNote?
      @note.canComment!
    elsif @note.canComment?
      @note.cannotComment!
    end
    redirect_to notes_url, notice: 'Note status has been changed to: ' + @note.status
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = Note.friendly.find(params[:id])

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def note_params
      params.require(:note).permit(:title, :body, :course_id)
    end


end
