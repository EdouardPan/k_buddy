class TreatmentsController < ApplicationController

  def show
    @treatment = Treatment.find(params[:id])
    authorize @treatment
    @prescription = @treatment.prescription
  end

  def update
    @treatment = Treatment.find(params[:id])
    authorize @treatment

    # treatment.taken = true
    # treatment.save!

    if @treatment.update!(taken: true)
      respond_to do |format|
        format.html {redirect_to treatment_path(@treatment)}
        format.js
      end
    end
  end
end
