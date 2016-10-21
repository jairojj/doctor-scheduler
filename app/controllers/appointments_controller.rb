class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index]
  
  def new
    @doctor_id = params[:id]
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:id])
  end
  
  def index
    @appointment = Appointment.where(pacient_id: current_user.id).select(:id, :doctor_id, :appointment_type, :date, :start)
  end

  def create
    @appointment = Appointment.new(params.require(:appointment).permit(:doctor_id, :pacient_id, :appointment_type, :date, :start))
    if @appointment.save
      flash[:success] = 'Consulta marcada com sucesso'
      redirect_to '/doctors'
    else
      flash[:danger] = 'Erro'
      redirect_to '/doctors'
    end
  end
  
  def destroy
    @appointment = Appointment.find(params[:id])
    @appointment.destroy
    flash[:success] = "Consulta cancelada com sucesso"
    redirect_to '/appointments/index'
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/home'
    end
  end

end
