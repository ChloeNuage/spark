class Message < ApplicationRecord
  belongs_to :match
  belongs_to :conversation
  belongs_to :user
end
