class MatchsController < ApplicationController

  def index
    @matches = Match.all
    @user = current_user
  end

  def show
    @match = Match.find(params[:id])
<<<<<<< HEAD
    @user = current_user
=======
    @appointments = @match.appointments
>>>>>>> bf95b0e34c51fe62c553b82c13fa089db2fdcf2b
    @conversation = Conversation.where(match_id: @match.id).last
    if @conversation.nil?
      @conversation = Conversation.create!(match_id: @match.id, user_id: current_user.id, shelter_id: @match.pet.shelter.id)
    end
    @message = Message.new
    @messages = @conversation.messages
  end

  def create
      @match = Match.create!(user_id: current_user.id, pet_id: params[:pet_id])

      if @match.save
        flash[:notice] = 'Match créé avec succès!'
      else
        render :index, alert: 'Erreur lors de la création du match.'
      end
  end

  def click_message
    @match = Match.where(user: current_user).last
    redirect_to match_path(@match)
  end

  private

  def match_params
    params.require(:match).permit(:pet_id, :user_id)
  end
end
