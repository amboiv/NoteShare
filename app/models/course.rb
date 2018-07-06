class Course < ApplicationRecord
    validates_presence_of :name, :code, :credits, :main_image, :thumbnail

    has_many :notes


    after_initialize :set_defaults
    def set_defaults
        self.main_image ||= "https://placeholdit.co//i/600x300?"
        self.thumbnail ||= "https://placeholdit.co//i/300x150?"
    end
end
