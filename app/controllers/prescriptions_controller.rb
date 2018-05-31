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
    prescription = Prescription.new(
      medical_professional_id: params[:medical_professional_id],
      start_date: params[:prescription][:start_date],
      end_date: params[:prescription][:end_date]
      )
    authorize prescription


    if prescription.save
      # Create the instances of treatement with the info we have.
      raise

      # treatement = Treatement.new
        # individual_treatement = prescription.end_date - prescription.start_date * the length of the take array
        # individual_treatement.times do treatement put this in an array that can be passed into the view
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
