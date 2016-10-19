class AppointmentsController < ApplicationController
  before_action :logged_in_user, only: [:new]
  
  def new
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:id])
    @time = [8,9,10,11,14,15,16,17]
  end

  def create
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/home'
    end
  end

end
