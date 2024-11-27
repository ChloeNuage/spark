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
      #### !!!! A ECRIRE !!!
    end

    @pets = MatchChecker.new(@user, @pets).can_match
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
