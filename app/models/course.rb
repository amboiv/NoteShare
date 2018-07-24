class Course < ApplicationRecord
    include Placeholder
    validates_presence_of :name, :code, :credits, :main_image, :thumbnail

    has_many :notes
    #belongs_to :education_program, optional: true
    has_many :education_programs, through: :courses_education_programs
    has_one_attached :thumbnail
    has_one_attached :main_image


    after_initialize :set_defaults
    def set_defaults
        self.main_image ||= Placeholder.generate_image(width: 600, height: 300)
        self.thumbnail ||= Placeholder.generate_image(width: 300, height: 150)
    end

    #mount_uploader :thumbnail, CourseUploader
    #mount_uploader :main_image, CourseUploader

    def self.by_position
        order("position ASC")
    end
end
