class PrescriptionsController < ApplicationController

  def index
    @prescriptions = policy_scope(Prescription)
  end

  def show
    authorize @prescription
  end

  def new
    @prescription = Prescription.new
    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    authorize @prescription
  end

  def create
    raise
    @prescription = Prescription.new(medical_professional_id: params[:medical_professional_id],
      )
    authorize @prescription

    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    @prescription.medical_professional = @medical_professional

    if @prescription.save
      redirect_to new_drug_path
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
