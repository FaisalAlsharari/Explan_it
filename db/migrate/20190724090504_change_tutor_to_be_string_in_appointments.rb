class ChangeTutorToBeStringInAppointments < ActiveRecord::Migration[5.2]
  def change
    change_column :appointments, :tutor, :string

  end
end
