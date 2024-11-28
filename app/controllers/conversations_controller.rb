class ConversationsController < ApplicationController
  before_action :find_match
  before_action :find_conversation

  def show
    @match = find_match
    @conversation = Conversation.find(params[:id])
    @message = Message.create!(conversation_id: @conversation.id, user_id: current_user.id, content: (params[:message][:content]))
    @messages = @conversation.messages
  end

  private

    def find_match
      @match = Match.find(1)
    end

    def find_conversation # Ensures that a conversation exists between the user and the shelter (linked via the match's pet)
      @conversation = @match.conversations.find_or_create_by(user: current_user, shelter: @match.pet.shelter)
    end
end
