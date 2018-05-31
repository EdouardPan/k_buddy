class CalendarController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
    @treatments = Treatment.where(user: current_user)

    @events = @appointments + @treatments

    # Day
    @events_js = []
    @events.each do |event|
      data = nil
      if event.is_a?(Appointment)
        data = {
          title: "#{event.category}_at_#{event.medical_professional.location_name}".gsub(" ", "_"),
          start: event.start_date.strftime("%Y-%m-%dT%H:%M:%S"),
          end: event.end_date.strftime("%Y-%m-%dT%H:%M:%S"),
          icon: "fas_fa-user-md"
        }
        @events_js << data
      else
        data = {
          title: "#{event.drug.name}_-_#{event.quantity}".gsub(" ", "_"),
          start: event.take_time.strftime("%Y-%m-%dT%H:%M:%S"),
          end: (event.take_time + 0.5 / 24).strftime("%Y-%m-%dT%H:%M:%S"),
          icon: "fas_fa-capsules"
        }
        @events_js << data
      end
    end

    @events_day = @events_js.to_json

    # Week
    @events_js = []
    @events.each do |event|
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



    @events_week = @events_js.to_json

    # Day
    @events_month = ['test3', 'test4'].to_json

  end

  def show
  end
end
