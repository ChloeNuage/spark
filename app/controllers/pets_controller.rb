class PetsController < ApplicationController
  def index
    @pets = Pet.all
    @pets = @pets.where(can_adopt_dog: true) 
  end

  def show
    @pet = Pet.find(params[:id])
  end

end
