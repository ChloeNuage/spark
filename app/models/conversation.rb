class Conversation < ApplicationRecord
  belongs_to :match
  belongs_to :user
  belongs_to :shelter
end
