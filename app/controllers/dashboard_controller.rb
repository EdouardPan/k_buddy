class DashboardController < ApplicationController
  def today_tasks
    @appointments = policy_scope(Appointment)
    @appointments = Appointment.all #where(start_date: Date.today)
    @medical_records = MedicalRecord.all
    @treatments = Treatment.all #where(take_time: Date.today)
  end
end
