class AddCourseReferenceToNotes < ActiveRecord::Migration[5.2]
  def change
    add_reference :notes, :course, foreign_key: true
  end
end
