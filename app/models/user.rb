class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_create :adopt_check

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :matchs, dependent: :destroy
  has_many :appointments, dependent: :destroy

  belongs_to :shelter

  private

  def adopt_check
    self.can_adopt_dog = CanAdoptChecker.new(self).can_adopt_dog?
    self.can_adopt_cat = CanAdoptChecker.new(self).can_adopt_cat?
    self.can_adopt_nac = CanAdoptChecker.new(self).can_adopt_nac?
    self.save
  end
end
