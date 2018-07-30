class Course < ApplicationRecord
    validates_presence_of :name, :code, :credits

    extend FriendlyId
    friendly_id :name, use: :slugged

    has_many :notes
    has_many :lectures
    has_many :course_education_programs
    has_many :education_programs, through: :course_education_programs
    has_one_attached :thumbnail
    has_one_attached :main_image
    accepts_nested_attributes_for :education_programs,
                                    allow_destroy: true,
                                    reject_if: lambda { |attributes| attributes['title'].blank? }

    def self.by_position
        order("position ASC")
    end
end
