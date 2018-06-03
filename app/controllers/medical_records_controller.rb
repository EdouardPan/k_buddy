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
      if params[:medical_record][:url].nil?
        redirect_to medical_record_path(@medical_record)
      else
        params[:medical_record][:url].each do |u|
          new_photo = Photo.new(url: u)
          new_photo.medical_record = @medical_record
          new_photo.save
        end
        redirect_to medical_record_path(@medical_record)
      end
    else
      render :new
    end
  end


  def edit
    @medical_record = MedicalRecord.find(params[:id])
    authorize @medical_record
  end

  def update
    @medical_record = MedicalRecord.find(params[:id])
    authorize @medical_record
    if @medical_record.update(medical_record_params)
      if params[:medical_record][:url].nil?
        redirect_to medical_record_path(@medical_record)
      else
        params[:medical_record][:url].each do |u|
          new_photo = Photo.new(url: u)
          new_photo.medical_record = @medical_record
          new_photo.save
        end
        redirect_to medical_record_path(@medical_record)
      end
    else
      render :edit
    end
  end

  def destroy
    @medical_record = MedicalRecord.find(params[:id])
    authorize @medical_record
    @medical_record.destroy
    redirect_to medical_records_path
  end


  private

  def set_medical_records
    @medical_record = MedicalRecord.find(params[:id])
  end

  def medical_record_params
    params.require(:medical_record).permit(:record_date, :title, :category, :description, {photos: []})
  end

end
