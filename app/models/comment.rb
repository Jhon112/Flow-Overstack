class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  validates :text, presence: {message: "Type a comment!"}

end
