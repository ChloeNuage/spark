class Appointment < ApplicationRecord

  after_create_commit -> {
    broadcast_append_to "match_#{match.id}_appointments",
    partial: "appointments/appointment",
    target: "appointments"
  }
  after_destroy_commit -> {
    broadcast_remove_to "match_#{match.id}_appointments",
    partial: "appointments/appointment",
    target: "appointments"
  }

  belongs_to :match
  belongs_to :user
  belongs_to :shelter

  validates :date, presence: true
end
