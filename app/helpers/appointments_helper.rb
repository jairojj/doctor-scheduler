module AppointmentsHelper
  def get_doctor_by_id(id)
    return Doctor.find(id)
  end  
  
  def get_pacient_by_id(id)
    return Pacient.find(id)
  end  

end
