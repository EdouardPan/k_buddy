class PrescriptionsController < ApplicationController

  def index
    @prescriptions = policy_scope(Prescription)
  end

  def show
    @prescription = Prescription.find(params[:id])
    authorize @prescription
    @treatements = Treatment.all
  end

  def new
    @prescription = Prescription.new
    @prescription.treatments.build
    @drugs = Drug.all
    @medical_professional = MedicalProfessional.find(params[:medical_professional_id])
    authorize @prescription
  end

  def create
    raise
    prescription = Prescription.new(
      medical_professional_id: params[:medical_professional_id],
      start_date: params[:prescription][:start_date],
      end_date: params[:prescription][:end_date]
      )
    authorize prescription

    if prescription.save

      # Photos adding
      unless params[:prescription][:url].nil?
        params[:prescription][:url].each do |u|
          new_photo = Photo.new(url: u)
          new_photo.prescription = @prescription
          new_photo.save
        end
      end

      # Save info for the creation of instances of Treatment
      this_date = prescription.start_date
      duration = (prescription.end_date.to_date - this_date.to_date).to_i
      drug = Drug.find_by(name: params[:drug_name])

      # Treatments creation
      duration.times do
        # each treatement is in a hash iterate
        counter = 1
        params[:traitement_take_time].each do |k, v|
          treatment = Treatment.new(
            prescription_id: prescription.id,
            drug_id: drug.id,
            take_time: DateTime.new(this_date.year, this_date.month, this_date.day, Time.parse(v).hour, Time.parse(v).min),
            quantity: params[:traitement_quantity]["quantity#{counter}"],
            user_id: current_user.id)
          unless treatment.save
            render '/prescriptions/new'
            # There is still an error here. It does not render if the treatments are not created.
          end
          counter += 1
        end
        this_date += 1.day
      end
      redirect_to calendar_index_path

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
