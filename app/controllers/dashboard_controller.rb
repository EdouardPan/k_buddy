class DashboardController < ApplicationController


  def today_tasks

    @appointments = policy_scope(Appointment)
    @treatments = policy_scope(Treatment)
    @appointments = @appointments.where(start_date: Date.today.beginning_of_day..Date.today.end_of_day)
    @treatments = @treatments.where(take_time: Date.today.beginning_of_day..Date.today.end_of_day)

    @events = @appointments + @treatments

    @events_grouped = @events.sort_by { |event| event.sorting_date }
  end

end
