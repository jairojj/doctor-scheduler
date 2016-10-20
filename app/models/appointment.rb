class Appointment < ApplicationRecord
  belongs_to :pacient
  belongs_to :doctor
  
  validates :appointment_type,  presence: true, length: { maximum: 50 }
  validates :start,  presence: true, length: { maximum: 50 }
  validates :date,  presence: true, length: { maximum: 50 }
end
