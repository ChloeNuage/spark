class MessagesController < ApplicationController
  before_action :find_match

  # def index
  #     @messages = @match.messages
  #     @message = @match.messages.new
  # end

  def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.match = @match
    if @message.save
      redirect_to match_messages_path(@match)
    else
      render :index
    end
  end

  private

  def find_match
    @match = Match.find(params[:match_id])
  end

  def message_params
    params.require(:message).permit(:content)
  end
end
