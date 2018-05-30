class PrescriptionsController < ApplicationController

  def index
    @prescriptions = policy_scope(Prescription)
  end

  def show
    authorize @prescription
  end

  def new
    @prescription = Prescription.new
    authorize @prescription
  end

  def create
    @prescription = Prescription.new(prescription_params)
    authorize @prescription

    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    authorize medical_professional

    @prescription.medical_professional = @medical_professional

    if @Prescription.save
      raise
      # We want to go to a drug picker.
    else
      render '/prescriptions/new'
    end

  end

  def edit
    authorize @prescription
  end

  def update
    authorize @prescription
  end

  def destroy
    authorize @prescription
  end

  private

  def prescription_params
    params.require(:prescription).permit(:start_date, :end_date, :photos)
  end
end
