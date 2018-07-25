class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :content, presence: true, length: { minimum: 7, maximum: 500 }
end
