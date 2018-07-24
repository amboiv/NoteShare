class Course < ApplicationRecord
    validates_presence_of :name, :code, :credits

    has_many :notes
    #belongs_to :education_program, optional: true
    has_many :education_programs, through: :courses_education_programs
    has_one_attached :thumbnail
    has_one_attached :main_image

    def self.by_position
        order("position ASC")
    end
end
