class Note < ApplicationRecord
    enum status: { canComment: 0, cannotComment: 1, privateNote: 2}
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body

    belongs_to :course

    def self.not_commentable
        where(status: 'cannotComment')
    end
end
