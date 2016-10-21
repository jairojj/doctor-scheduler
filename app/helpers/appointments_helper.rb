module AppointmentsHelper
  def get_doctor_by_id(id)
    return Doctor.find(id)
  end  
end
