class ConversationsController < ApplicationController
  before_action :find_match
  before_action :find_conversation

  def show
    raise
    @match = find_match
    @conversation = Conversation.find(params[:id])
    @message = Message.create!(conversation_id: @conversation.id, user_id: current_user.id, content: (params[:message][:content]))
    @messages = @conversation.messages
  end

  private

    def find_match
      @match = Match.find(1)
    end
end
