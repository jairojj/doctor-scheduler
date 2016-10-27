module LoginHelper
  def log_in(obj, type)
    if type == "pacient"
      session[:pacient_id] = obj.id
    else
      session[:doctor_id] = obj.id
    end
  end
    
    # Returns the current logged-in user (if any).
  def current_user
    if session[:pacient_id]
      @current_user ||= Pacient.find_by(id: session[:pacient_id])
    else
      @current_user ||= Doctor.find_by(id: session[:doctor_id])
    end
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    if session[:pacient_id]
      session.delete(:pacient_id)
    else
      session.delete(:doctor_id)
    end
    @current_user = nil
  end

end
