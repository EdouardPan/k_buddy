class DashboardController < ApplicationController
  def today_tasks
    @appointments = policy_scope(Appointment)
  end
end
