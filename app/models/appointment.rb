class Appointment < ApplicationRecord
  belongs_to :pacient
  belongs_to :doctor
  
  validates :appointment_type,  presence: true, length: { maximum: 50 }
  validates :start,  presence: true, length: { maximum: 50 }, numericality: { only_integer: true }
  validates :date,  presence: true, length: { maximum: 50 }
  
  def self.delete_old
    @appointment = Appointment.all
    @appointment.each do |appointment|
      if appointment.date < Date.today
        appointment.delete
      end
    end
  end
  
end
