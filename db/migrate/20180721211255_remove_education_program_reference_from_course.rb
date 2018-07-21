class RemoveEducationProgramReferenceFromCourse < ActiveRecord::Migration[5.2]
  def change
    remove_reference :courses, :education_program, foreign_key: true
  end
end
