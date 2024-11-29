class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create :broadcast_message

  def broadcast_message
    broadcast_append_to "matchs_#{conversation_id}_messages", partial: 'matchs/message', target: "messages", locals: { message: self }
  end
end
