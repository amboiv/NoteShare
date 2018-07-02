class Note < ApplicationRecord
    enum status: { canComment: 0, cannotComment: 1}
    extend FriendlyId
    friendly_id :title, use: :slugged
end
