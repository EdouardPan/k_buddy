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
      raise
      # Create the instances of treatement with the info we have.
      this_date = prescription.start_date
      while this_date < prescription.end_date + 1
        # each treatement is in a hash iterate
        params[:traitement_take_time].each do |k, v|
          Treatment.create(
            prescription_id: prescription.id,
            drug_id: params[:drug],
            take_time: this_date + v.hour,
            quantity:
            user_id: current_user.id
            )
        end
        this_date += 1
      end


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
    # how to add multiple params?
  end
end
