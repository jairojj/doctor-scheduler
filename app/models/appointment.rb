class Appointment < ApplicationRecord
  belongs_to :pacient
  belongs_to :doctor
end
