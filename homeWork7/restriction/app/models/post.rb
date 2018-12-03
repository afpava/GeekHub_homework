class Post < ApplicationRecord
  belongs_to :user
  validates :title, :presence => true, uniqueness: { scope: :user,
    message: "Title exists!" }
  validates :text, presence: true
end
