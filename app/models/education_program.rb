class EducationProgram < ApplicationRecord
    validates_presence_of :title, :academic_degree
    enum academic_degree: { bachelor: 0, master: 1, one_year_program: 2, other: 100}
end
