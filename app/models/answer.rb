class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  has_many :comments
  validates :text, presence: {message: "We do not accept blank answers"}
end
