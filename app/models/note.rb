class Note < ApplicationRecord
    enum status: { canComment: 0, cannotComment: 1, privateNote: 2}
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body

    belongs_to :course
    belongs_to :user

    has_many :comments, dependent: :destroy

    def self.not_commentable
        where(status: 'cannotComment')
    end

    def self.featured_notes
        limit(2)
    end

end
