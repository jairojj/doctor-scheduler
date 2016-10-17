class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
    @doctor = Doctor.find(params[:id])
  end

  def create
  end
end
