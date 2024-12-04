class PagesController < ApplicationController
  def home
    if user_signed_in?
      redirect_to pets_path
    else
      redirect_to welcome_path
    end
  end
end
