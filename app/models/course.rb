class Course < ApplicationRecord
    include Placeholder
    validates_presence_of :name, :code, :credits, :main_image, :thumbnail

    has_many :notes
    #belongs_to :education_program, optional: true
    has_many :education_programs, through: :courses_education_programs


    after_initialize :set_defaults
    def set_defaults
        self.main_image ||= Placeholder.generate_image(width: 600, height: 300)
        self.thumbnail ||= Placeholder.generate_image(width: 300, height: 150)
    end
end
