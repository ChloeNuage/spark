class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  after_save :adopt_check, if: :completed_profile?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :matchs, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_one_attached :photo
  belongs_to :shelter, optional: true

  private

  def adopt_check
    self.can_adopt_dog = CanAdoptChecker.new(self).can_adopt_dog?
    self.can_adopt_cat = CanAdoptChecker.new(self).can_adopt_cat?
    self.can_adopt_nac = CanAdoptChecker.new(self).can_adopt_nac?
    self.save
  end

  def completed_profile?
    self.can_adopt_dog.nil? &&
    self.can_adopt_cat.nil? &&
    self.can_adopt_nac.nil? &&
    !self.pet_budget.nil? &&
    !self.has_green_space.nil?
  end
end
