class DashboardController < ApplicationController


  def today_tasks
    @medical_records = MedicalRecord.all
    @appointments = policy_scope(Appointment)
    @appointments = Appointment.where(start_date: Date.today.beginning_of_day..Date.today.end_of_day)
    @treatments = Treatment.where(take_time: Date.today.beginning_of_day..Date.today.end_of_day)

    @events = @appointments + @treatments

    @events_grouped = @events.sort_by { |event| event.sorting_date }
  end

end
