class EducationProgram < ApplicationRecord

    #has_many :courses
    has_many :users
    has_many :courses, through: :courses_education_programs
    accepts_nested_attributes_for :courses, 
                                    reject_if: lambda { |attributes| attributes['name'].blank? }

   
    validates_presence_of :title, :academic_degree
    enum academic_degree: { bachelor: 0, master: 1, one_year_program: 2, other: 100}
end
