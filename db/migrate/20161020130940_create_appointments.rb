class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.integer :doctor_id
      t.integer :pacient_id
      t.string :type
      t.integer :start
      t.date :date

      t.timestamps
    end
  end
end
