class CourseEducationProgram < ApplicationRecord
    belongs_to :course
    belongs_to :education_program
end