class EducationProgram < ApplicationRecord
    include Placeholder

    has_many :courses

    validates_presence_of :title, :academic_degree
    enum academic_degree: { bachelor: 0, master: 1, one_year_program: 2, other: 100}

    after_initialize :set_defaults
    def set_defaults
        self.badge ||= Placeholder.generate_image(width: 50, height: 50)
    end
end
