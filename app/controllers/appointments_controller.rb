class AppointmentsController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
  end

  def show
    authorize @appointment
  end

  def new
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    authorize @appointment
  end

  def edit
    authorize @appointment
  end

  def update
    authorize @appointment
  end

  def destroy
    authorize @appointment
  end
end
