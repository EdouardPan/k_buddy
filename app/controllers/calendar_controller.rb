class CalendarController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
    @treatments = Treatment.where(user: current_user)

    @events = @appointments + @treatments


    # Month
    @events_grouped = @events.group_by do |event|
      event.is_a?(Appointment) ? event.start_date.to_date : event.take_time.to_date
    end

    @events_js = []
    @events_grouped.each do |date_event|
      a = date_event[1].any? { |obj| obj.is_a?(Appointment) }
      t = date_event[1].any? { |obj| obj.is_a?(Treatment) }
      puts taken = date_event[1].any? { |obj| obj.is_a?(Treatment) && obj.taken == false }
      data = {
        title: '',
        start: date_event[0].to_date,
        iconA: a,
        iconT: t,
        taken: !taken
      }
      @events_js << data
    end

    @events_month = @events_js

    # Week
    @events_js = []
    @events.each do |event|
      data = nil
      if event.is_a?(Appointment)
        data = {
          title: event.category,
          start: event.start_date.strftime("%Y-%m-%dT%H:%M:%S"),
          end: event.end_date.strftime("%Y-%m-%dT%H:%M:%S"),
          iconA: true
        }
        @events_js << data
      else
        data = {
          title: event.drug.name,
          start: event.take_time.strftime("%Y-%m-%dT%H:%M:%S"),
          end: (event.take_time + 0.5 / 24).strftime("%Y-%m-%dT%H:%M:%S"),
          iconT: true
        }
        @events_js << data
      end
    end

    @events_week = @events_js

    # Day
    @events_js = []
    @events.each do |event|
      data = nil
      if event.is_a?(Appointment)
        data = {
          title: "#{event.category} - #{event.medical_professional.location_name}",
          start: event.start_date.strftime("%Y-%m-%dT%H:%M:%S"),
          end: event.end_date.strftime("%Y-%m-%dT%H:%M:%S"),
          iconA: true,
          url: appointment_path(event),
          backgroundColor: '#469AE0'
        }
        @events_js << data
      else
        data = {
          title: "#{event.drug.name} - #{event.quantity}",
          start: event.take_time.strftime("%Y-%m-%dT%H:%M:%S"),
          end: (event.take_time + 0.5 / 24).strftime("%Y-%m-%dT%H:%M:%S"),
          iconT: true,
          url: treatment_path(event),
          taken: event.taken,
          backgroundColor: '#32B796',
          borderColor: '#00A896'
        }
        @events_js << data
      end
    end

    @events_day = @events_js

  end

  def show
  end
end
