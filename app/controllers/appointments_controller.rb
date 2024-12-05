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
    @appointment.match = Match.find(params[:match_id])
    @appointment.user_id = @appointment.match.user_id
    @appointment.shelter = @appointment.match.pet.shelter

    if @appointment.save
      redirect_to match_path(@appointment.match), notice: "Rendez-vous créé avec succès."
      # Actuellement :: Redirige l'utilisateur vers la page listant tous les pets
    else
      render :new, alert: "There was an error creating the appointment."
    end
  end

  def destroy
    @match = Match.find(params[:match_id])
    @appointment = @match.appointments.find(params[:id])
    @appointment.destroy

    redirect_back(
      fallback_location: match_path(@match),
      notice: 'Rendez-vous annulé avec succès.'
    )
  end

  private

  def appointment_params
    params.require(:appointment).permit(:date)
  end
end
