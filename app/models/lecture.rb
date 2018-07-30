class Lecture < ApplicationRecord
    validates_presence_of :title, :date, :course_id

    extend FriendlyId
    friendly_id :combined_slug, use: :slugged

    belongs_to :course
    has_many :notes

    def self.for_current_course
        #includes(:notes).where.
    end

    def combined_slug
        "#{date}-#{title}"
    end
end