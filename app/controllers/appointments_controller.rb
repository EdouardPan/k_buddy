class AppointmentsController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
  end

  def show
    authorize @appointment
  end

  def new
    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
    @appointment.user = current_user
    @appointment.medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    if @appointment.save
      redirect_to calendar_index_path
    else
      render :new
    end
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

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :category, :description, :photos)
  end
end
