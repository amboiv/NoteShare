class ChangeCoursesEducationProgramsToCourseEducationPrograms < ActiveRecord::Migration[5.2]
  def change
    rename_table :courses_education_programs, :course_education_programs
  end
end
