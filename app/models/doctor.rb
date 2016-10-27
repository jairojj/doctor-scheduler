class Doctor < ApplicationRecord
  has_many :appointments
  has_secure_password
end
