class CalendarController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
  end

  def show
  end
end
