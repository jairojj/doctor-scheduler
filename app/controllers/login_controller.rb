class LoginController < ApplicationController
  before_action :logged_in_user, only: [:new]
  def new
      
  end
  
  def create
    pacient = Pacient.find_by(email: params[:login][:email].downcase)
    if pacient && pacient.authenticate(params[:login][:password])
      log_in pacient
      redirect_to '/home'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
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
