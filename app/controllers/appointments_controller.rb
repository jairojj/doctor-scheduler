class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  
  def new
    @doctor_id = params[:id]
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:id])
  end

  def create
    @appointment = Appointment.new(params.require(:appointment).permit(@doctor_id, @current_user.id, :appointment_type, :start, :date))
    if @appointment.save
      redirect_to '/doctors'
      flash.now[:default] = 'Consulta marcada com sucesso'
    else
      render 'new'
    end
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/home'
    end
  end

end
