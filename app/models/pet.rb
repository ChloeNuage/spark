class Pet < ApplicationRecord
  belongs_to :specie
  belongs_to :shelter
  has_many :matchs, dependent: :destroy
  has_many_attached :photos

  private

  def self.unmatched_for(user)
    where.not(id: Match.where(user_id: user.id).select(:pet_id))
  end
end
