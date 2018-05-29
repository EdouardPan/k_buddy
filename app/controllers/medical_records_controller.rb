class MedicalRecordsController < ApplicationController

  def index
    @medical_records = policy_scope(MedicalRecord)
    @medical_records = MedicalRecord.all
  end

  def show
    authorize @medical_record
  end

  def new
    authorize @medical_record
  end

  def create
    authorize @medical_record
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
end
