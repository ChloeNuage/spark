class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.all
  end

  def new
    @appointment = Appointment.new
    @match = Match.find(params[:match_id])
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.user = current_user
    @appointment.match = Match.find(params[:match_id])
    @appointment.shelter = @appointment.match.pet.shelter

    if @appointment.save
      redirect_to pets_path, notice: "Rendez-vous créé avec succès."
      # Actuellement :: Redirige l'utilisateur vers la page listant tous les pets
    else
      render :new, alert: "There was an error creating the appointment."
    end
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
