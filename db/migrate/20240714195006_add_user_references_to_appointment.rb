class AddUserReferencesToAppointment < ActiveRecord::Migration[7.1]
  def change
    add_column :appointments, :coach_id, :integer
    add_column :appointments, :client_id, :integer, null: true
  end
end
