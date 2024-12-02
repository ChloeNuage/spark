class MessagesController < ApplicationController
  before_action :find_match

  def create
    @match = Match.find(params[:match_id])
    @conversation = Conversation.find(params[:conversation_id])
    @message = Message.create(content: params[:message][:content])
    @message.user = current_user
    @message.conversation_id = params[:conversation_id]
    if @message.save!
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.append( :messages, partial: "matchs/message",
            target: "chat-messages", locals: { message: @message, user: current_user } )
        end
        format.html { redirect_to match_path(@match) }
      end
    else
      raise
      render 'matchs/show', status: :unprocessable_entity
    end
  end

  private

  def find_match
    @match = Match.find(params[:match_id])
  end

  # def message_params
  #   params.require(:message).permit(:content)
  # end
end
