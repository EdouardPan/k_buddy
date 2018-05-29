class SymptomsController < ApplicationController

  def index
    @symptoms = policy_scope(Symptom)
  end

  def show
    authorize @symptom
  end

  def new
    authorize @symptom
  end

  def create
    authorize @symptom
  end

  def edit
    authorize @symptom
  end

  def update
    authorize @symptom
  end

  def destroy
    authorize @symptom
  end
end
