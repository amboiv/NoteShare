class AddEducationProgramReferenceToCourse < ActiveRecord::Migration[5.2]
  def change
    add_reference :courses, :education_program, foreign_key: true
  end
end
