class Note < ApplicationRecord
    enum status: { canComment: 0, cannotComment: 1, privateNote: 2}
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body, :user_id, :course_id, :lecture_id

    belongs_to :course
    belongs_to :user
    belongs_to :lecture

    has_many :comments, dependent: :destroy

    def self.not_commentable
        where(status: 'cannotComment')
    end

    def self.featured_notes
        limit(2)
    end

    def self.paginate_notes(page)
        page(page).per(10).order('updated_at DESC')
    end

end
