class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :content, presence: true, length: { minimum: 3, maximum: 1000 }

  after_create_commit { CommentBroadcastJob.perform_later(self) }
end
