class MedicalRecordsController < ApplicationController
  before_action :set_medical_records, only: [:show, :edit, :update, :destroy]

  def index
    @medical_records = policy_scope(MedicalRecord)

    if params[:query].present?
      @medical_records = @medical_records.search(params[:query])
    end
  end

  def show
    authorize @medical_record
  end

  def new
    @medical_record = MedicalRecord.new
    authorize @medical_record
  end

  def create
    @medical_record = MedicalRecord.new(medical_record_params)
    authorize @medical_record
    @medical_record.user = current_user
    if @medical_record.save
      redirect_to medical_record_path(@medical_record)
    else
      render :new
    end
  end


  def edit
    authorize @medical_record
  end

  def update
    authorize @medical_record
  end

  def destroy
    authorize @medical_record
  end



  private

  def set_medical_records
    @medical_record = MedicalRecord.find(params[:id])
  end

  def medical_record_params
    params.require(:medical_record).permit(:record_date, :title, :category, :description, {photos: []})
  end

end
