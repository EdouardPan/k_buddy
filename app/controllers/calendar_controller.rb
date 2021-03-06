class CalendarController < ApplicationController

include ActionView::Helpers::AssetUrlHelper

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
        taken: !taken,
        img_path_A: ActionController::Base.helpers.image_path('doctor.png'),
        img_path_T: ActionController::Base.helpers.image_path('treatment-icon.png'),
        img_path_T_taken: ActionController::Base.helpers.image_path('treatment-icon-2.png')
      }
      @events_js << data
    end

    @events_month = @events_js

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
          backgroundColor: '#469AE0',
          img_path_A: ActionController::Base.helpers.image_path('doctor.png')
        }
        @events_js << data
      else
        data = {
          title: "#{event.drug.name} - #{event.quantity}",
          start: event.take_time.strftime("%Y-%m-%dT%H:%M:%S"),
          end: (event.take_time + 1.hour).strftime("%Y-%m-%dT%H:%M:%S"),
          iconT: true,
          url: treatment_path(event),
          taken: event.taken,
          backgroundColor: '#32B796',
          borderColor: '#00A896',
          img_path_T: ActionController::Base.helpers.image_path('treatment-icon.png'),
          img_path_T_taken: ActionController::Base.helpers.image_path('treatment-icon-2.png')
        }
        @events_js << data
      end
    end

    @events_day = @events_js

  end

  def show
  end
end
