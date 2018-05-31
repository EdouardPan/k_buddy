class CalendarController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
    @treatments = Treatment.where(user: current_user)

    @events = @appointments + @treatments

    @events_js = []
    @events.first(100).each do |event|
      data = nil
      if event.is_a?(Appointment)
        data = {
          title: "A",
          start: event.start_date.strftime("%Y-%m-%dT%H:%M:%S"),
          end: event.end_date.strftime("%Y-%m-%dT%H:%M:%S"),
          icon: "fas_fa-user-md"
        }
        @events_js << data
      else
        data = {
          title: "T",
          start: event.take_time.strftime("%Y-%m-%dT%H:%M:%S"),
          end: (event.take_time + 0.5 / 24).strftime("%Y-%m-%dT%H:%M:%S"),
          icon: "fas_fa-capsules"
        }
        @events_js << data
      end
    end

    @events_js = @events_js.to_json
  end

  def show
  end
end
