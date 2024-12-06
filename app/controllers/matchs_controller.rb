class MatchsController < ApplicationController

  def index

    # Le user est un adoptant
    if current_user.shelter_id.nil?
      @matches = Match.where(user: current_user)

      @matches_without_messages = @matches.select do |match|
        conversation = Conversation.where(match: match.id).last
        if conversation.nil?
          true
        else
          message = Message.where(conversation_id: conversation.id).last
          message.nil?
        end
      end

      @matches_with_messages = @matches.select do |match|
        conversation = Conversation.where(match: match.id).last
        if conversation.nil?
          false
        else
          message = Message.where(conversation_id: conversation.id).last
          !message.nil?
        end
      end

    # Le user est un refuge
    else
      # On récupère les matches des pets du refuge
      @matches = Match.where(pet: Pet.where(shelter: current_user.shelter))

      # On récupère les matches sans messages
      @matches_without_messages = @matches.select do |match|
        conversation = Conversation.where(match: match.id).last
        if conversation.nil?
          true
        else
          message = Message.where(conversation_id: conversation.id).last
          message.nil?
        end
      end

      # On récupère les matches avec messages
      @matches_with_messages = @matches.select do |match|
        conversation = Conversation.where(match: match.id).last
        if conversation.nil?
          false
        else
          message = Message.where(conversation_id: conversation.id).last
          !message.nil?
        end
      end
    end

    @user = current_user
  end

  def show
    @match = Match.find(params[:id])
    @user = current_user

    @appointments = @match.appointments
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
