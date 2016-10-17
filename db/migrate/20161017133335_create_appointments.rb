class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.string :doctor_id
      t.string :pacient_id
      t.string :type
      t.time :start
      t.time :end
      t.datetime :date

      t.timestamps
    end
  end
end
