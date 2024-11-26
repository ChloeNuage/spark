class Specie < ApplicationRecord
  has_many :pets, dependent: :destroy

end
