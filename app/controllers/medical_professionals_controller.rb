class MedicalProfessionalsController < ApplicationController

  def index
    @medical_professionals = policy_scope(MedicalProfessional)
  end

  def show
    authorize @medical_professional
  end

  def new
    @event_type = params[:event_type]
    @medical_professional = MedicalProfessional.new
    authorize @medical_professional
  end

  def create
    @medical_professional = MedicalProfessional.new
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
    authorize @medical_professional
  end

  def update
    authorize @medical_professional
  end

  def destroy
    authorize @medical_professional
  end
end
