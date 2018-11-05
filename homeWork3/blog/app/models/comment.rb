class Comment < ApplicationRecord
#class Comment < ActiveRecord::Base
  belongs_to :article
validates :author, :body, presence: true,
                  length: { minimum: 1 }
end
