class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index]
  before_action :who, only: [:new]
  
  def new
    @doctor_id = params[:id]
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:id])
    @today = Date.today
  end
  
  def index
    if who_user == 'pacient'
      @appointment = Appointment.where(pacient_id: current_user.id).select(:id, :doctor_id, :appointment_type, :date, :start)
    else
      @appointment = Appointment.where(doctor_id: current_user.id).select(:id, :pacient_id, :appointment_type, :date, :start)
    end
  end

  def create
    @appointment = Appointment.new(params.require(:appointment).permit(:doctor_id, :pacient_id, :appointment_type, :date, :start))
    if @appointment.save
      flash[:success] = 'Consulta marcada com sucesso'
      redirect_to '/doctors'
    else
      flash[:danger] = 'Erro'
      redirect_to "/appointments/new?id=#{params[:appointment][:doctor_id]}"
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
  
  #Verifica se o usuario logado é doutor
  def who
    if who_user == 'doctor'
      redirect_to '/home'
    end
  end

end
