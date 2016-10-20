class TimeController < ApplicationController
  before_action :logged_in_user, only: [:index]
  
  def index    
    @appointment = Appointment.where(doctor_id: params[:doctor_id], date: params[:date]).select(:start)
    @time = [8,9,10,11,14,15,16,17]
    
    if @appointment.empty?
      render json: {time: @time}
    else
      @appointment.each do |appointment|
        @time.delete_if { |time| time == appointment.start.to_i}
      end
      render json: {time: @time}
    end
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/home'
    end
  end

  
end
