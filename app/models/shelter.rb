class Shelter < ApplicationRecord
  has_many :conversations, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :pets, dependent: :destroy
  has_many :users
end
