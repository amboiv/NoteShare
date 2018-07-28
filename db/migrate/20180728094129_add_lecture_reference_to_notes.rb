class AddLectureReferenceToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :lecture, foreign_key: true
  end
end
