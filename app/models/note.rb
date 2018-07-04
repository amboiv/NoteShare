class Note < ApplicationRecord
    enum status: { canComment: 0, cannotComment: 1, privateNote: 2}
    extend FriendlyId
    friendly_id :title, use: :slugged

    validates_presence_of :title, :body
end
