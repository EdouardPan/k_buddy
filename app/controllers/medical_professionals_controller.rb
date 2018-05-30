class MedicalProfessionalsController < ApplicationController

  def index
    @medical_professionals = policy_scope(MedicalProfessional)
  end

  def show
    authorize @medical_professional
  end

  def new
    @medical_professional = MedicalProfessional.new
    authorize @medical_professional
  end

  def create
    authorize @medical_professional
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
