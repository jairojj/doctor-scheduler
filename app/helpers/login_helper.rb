module LoginHelper
  def log_in(pacient)
    session[:pacient_id] = pacient.id
  end
    
    # Returns the current logged-in user (if any).
  def current_user
    @current_user ||= Pacient.find_by(id: session[:pacient_id])
  end
  
  def logged_in?
    !current_user.nil?
  end
  
  def log_out
    session.delete(:pacient_id) 
    @current_user = nil
  end

end
