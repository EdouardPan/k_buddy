class SymptomsController < ApplicationController

  def index
    @symptoms = policy_scope(Symptom)
  end

  def show
    authorize @symptom
  end

  def new
    @symptom = Symptom.new
    authorize @symptom
  end

  def create
    @symptom = Symptom.new(symptom_params)
    authorize @symptom
    @symptom.user = current_user
    if @symptom.user.save
      redirect_to symptom_path(@symptom)
    else
      render :new
    end
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

private

  def symptom_params
    params.require(:symptom).permit(:name, :intensity, :start_date, :end_date, :description)
  end
end





