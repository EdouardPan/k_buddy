class TreatmentsController < ApplicationController

  def show
    @treatment = Treatment.find(params[:id])
    authorize @treatment
  end

  def update
    # raise
    treatment = Treatment.find(params[:id])
    authorize treatment

    # treatment.taken = true
    # treatment.save!

    treatment.update!(taken: true)

    redirect_to treatment_path(treatment)
  end
end
