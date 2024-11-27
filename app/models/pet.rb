class Pet < ApplicationRecord
  belongs_to :specie
  belongs_to :shelter

  has_many :matchs, dependent: :destroy

end
