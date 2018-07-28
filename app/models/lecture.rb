class Lecture < ApplicationRecord
    validates_presence_of :title, :date, :course_id

    belongs_to :course
    has_many :notes
end
