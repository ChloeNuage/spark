class Match < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  has_many :conversations, dependent: :destroy
  has_many :appointments, dependent: :destroy
end
