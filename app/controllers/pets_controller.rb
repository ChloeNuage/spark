class PetsController < ApplicationController
  def index
    @user = current_user

    categories = []
    categories << "Chien" if @user.can_adopt_dog
    categories << "Chat" if @user.can_adopt_cat
    categories << "NAC" if @user.can_adopt_nac

    if categories.any?
      @pets = Pet.where(category: categories)
    else
      @pets = []
    end

    @pets = MatchChecker.new(@user, @pets).can_match
    @pets = Pet.unmatched_for(current_user)
    @match = Match.new

  end

  def show
    @pet = Pet.find(params[:id])
  end

end
