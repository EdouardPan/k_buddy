class AppointmentsController < ApplicationController

  def index
    @appointments = policy_scope(Appointment)
  end

  def show
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def new
    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    @appointment = Appointment.new
    authorize @appointment
  end

  def create
    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    @appointment = Appointment.new(appointment_params)
    authorize @appointment
    @appointment.medical_professional = @medical_professional
    @appointment.user = current_user
    if @appointment.save
      redirect_to calendar_index_path
    else
      render :new
    end
  end




  def edit
    @appointment = Appointment.find(params[:id])
    authorize @appointment
  end

  def update
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    if @appointment.update(appointment_params)
      unless params[:appointment][:url].nil?
        params[:appointment][:url].each do |u|
          new_photo = Photo.new(url: u)
          new_photo.appointment = @appointment
          new_photo.save
        end
      end
      redirect_to appointment_path(@appointment)
    else
      render :edit
    end
  end

  def destroy
    @appointment = Appointment.find(params[:id])
    authorize @appointment
    @appointment.destroy
    redirect_to calendar_index_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:start_date, :end_date, :category, :description, :photos)
  end
end
