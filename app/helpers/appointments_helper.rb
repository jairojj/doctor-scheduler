module AppointmentsHelper
  def get_doctor_by_id(id)
    Doctor.find(id)
  end  
  
  def get_pacient_by_id(id)
    Pacient.find(id)
  end
  

end
