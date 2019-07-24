class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.datetime :time
      t.string :place
      t.boolean :accepted
      t.integer :tutor
      t.integer :course
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
