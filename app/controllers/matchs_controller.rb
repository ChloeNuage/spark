class MatchsController < ApplicationController

  def index
    @matches = Match.all
  end

  def create
      @match = Match.create!(user_id: current_user.id, pet_id: params[:pet_id])

      if @match.save
        flash[:notice] = 'Match créé avec succès !'
      else
        render :index, alert: 'Erreur lors de la création du match.'
      end
  end

  private
  def match_params
    params.require(:match).permit(:pet_id, :user_id)
  end



end
