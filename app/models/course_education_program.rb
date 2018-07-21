class CourseEducationProgram < ApplicationRecord
    validates_presence_of :course_id, :education_program_id

    belongs_to :courses
    belongs_to :education_program
end