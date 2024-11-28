class MessagesController < ApplicationController
  before_action :find_match
  before_action :find_or_create_conversation

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.conversation = @conversation

    if @message.save
      redirect_to match_path(@match)
    else
      render 'conversations/show', status: :unprocessable_entity
    end
  end

  private

  def find_match
    @match = Match.find(params[:match_id])
  end

  def find_or_create_conversation
    @conversation = @match.conversations.find_or_create_by(user: current_user, shelter: @match.pet.shelter)
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
