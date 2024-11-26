class Spacie < ApplicationRecord
  has_many :pets, dependent: :destroy

end
