class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @appointments = @user.appointments
    
  end

end
