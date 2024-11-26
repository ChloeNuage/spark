class Pet < ApplicationRecord
  belongs_to :spacie
  belongs_to :shelter

  has_many :matchs, dependent: :destroy

end
