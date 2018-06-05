class MedicalProfessionalsController < ApplicationController

  def index
    @medical_professionals = policy_scope(MedicalProfessional)
  end

  def show
    @medical_professional = MedicalProfessional.find(params[:id])
    authorize @medical_professional
  end

  def new
    @event_type = params[:event_type]
    @medical_professionals = policy_scope(MedicalProfessional)
    @medical_professional = MedicalProfessional.new
    authorize @medical_professional
  end

  def create
    if params[:medical_professional][:id]
      @medical_professional = MedicalProfessional.find(params[:medical_professional][:id])
    else
      @medical_professional = MedicalProfessional.new(medical_professional_params)
    end
    authorize @medical_professional
    if @medical_professional.save
      if params[:event_type] == "appointment"
        redirect_to new_medical_professional_appointment_path(@medical_professional)
      else
        redirect_to new_medical_professional_prescription_path(@medical_professional)
      end
    else
      render :new
    end
  end

  def edit
    @medical_professional = MedicalProfessional.find(params[:id])
    authorize @medical_professional
  end

  def update
    @medical_professional = MedicalProfessional.find(params[:id])
    authorize @medical_professional
    if @medical_professional.update(medical_professional_params)
      redirect_to medical_professional_path(@medical_professional)
    else
      render :edit
    end
  end

  def destroy
    @medical_professional = MedicalProfessional.find(params[:id])
    authorize @medical_professional
    @medical_professional.destroy
    redirect_to medical_professionals_path
  end

  private

  def medical_professional_params
    params.require(:medical_professional).permit(:location_name, :address, :phone, :specialty, :doctor, :email)
  end
end
