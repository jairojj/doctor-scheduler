class LoginController < ApplicationController
  before_action :logged_in_user, only: [:new]
  def new_pacient
  
  end
  
  def new_doctor
  
  end  
  
  def create
    if params[:login][:type] == "pacient"
      pacient = Pacient.find_by(email: params[:login][:email].downcase)
      if pacient && pacient.authenticate(params[:login][:password])
        log_in(pacient,"pacient")
        redirect_to '/home'
      else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new_pacient'
      end
      
    else
      doctor = Doctor.find_by(email: params[:login][:email].downcase)
      if doctor && doctor.authenticate(params[:login][:password])
        log_in(doctor,"doctor")
        redirect_to '/home'
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new_doctor'
      end
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
  def logged_in_user
    if logged_in?
      redirect_to '/home'
    end
  end
end
