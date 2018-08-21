class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :text, presence: {message: "We do not accept blank answers"}
end
