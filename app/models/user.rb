class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :messages, dependent: :destroy
  has_many :conversations, dependent: :destroy
  has_many :matchs, dependent: :destroy
  has_many :appointments, dependent: :destroy

  belongs_to :shelter
end
