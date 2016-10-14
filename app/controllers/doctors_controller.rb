class DoctorsController < ApplicationController
  before_action :logged_in_user, only: [:index]
  
  def index
    @doctor = Doctor.all
  end
  
  def logged_in_user
    unless logged_in?
      redirect_to '/home'
    end
  end

end
