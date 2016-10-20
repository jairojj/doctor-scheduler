class ChangeTypeNameInAppointments < ActiveRecord::Migration[5.0]
  def change
    rename_column :appointments, :type, :appointment_type  
  end
end
