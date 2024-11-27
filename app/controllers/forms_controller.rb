class FormsController < ApplicationController

  def tobegin
    @user = current_user
  end

  def aboutyou
    @user = current_user

  end

  def aboutyou_update
    @user = current_user

    if @user.update(user_params_aboutyou) # Met à jour les informations de l'utilisateur
      redirect_to welldone_path
    else
      flash.now[:alert] = "Erreur : Impossible de mettre à jour vos informations."
      render :aboutyou, status: :unprocessable_entity
    end
  end

  def welldone
    @user = current_user
  end

  def daily
    @user = current_user
  end

  def daily_update
    @user = current_user

    if @user.update(user_params_daily) # Met à jour les informations de l'utilisateur
      redirect_to almostdone_path
    else
      flash.now[:alert] = "Erreur : Impossible de mettre à jour vos informations."
      render :aboutyou, status: :unprocessable_entity
    end
  end

  def almostdone
    @user = current_user
  end

  def adoptionproject
    @user = current_user
  end

  def adoptionproject_update
    @user = current_user

    if @user.update(user_params_adoptionproject) # Met à jour les informations de l'utilisateur
      redirect_to XachangerX_path
    else
      flash.now[:alert] = "Erreur : Impossible de mettre à jour vos informations."
      render :aboutyou, status: :unprocessable_entity
    end
  end


  private

  def user_params_aboutyou
    params.require(:user).permit(:name, :age, :gender, :photo)
  end

  def user_params_daily
    params.require(:user).permit(:remote_work?, :address, :green_space, :household_size, :have_children?, :have_cat?, :have_dog?, :have_other_pets?, :lifestyle)
  end

  def user_params_adoptionproject
    params.require(:user).permit(:description, :time_for_pet, :daily_walk?, :pet_budget)
  end

end
