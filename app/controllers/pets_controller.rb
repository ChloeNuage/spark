class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @pets = @pets.where(can_adopt_dog: true)

    @pets = MatchChecker.new(current_user, @pets).can_match
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
