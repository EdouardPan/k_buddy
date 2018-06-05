class WellbeingsController < ApplicationController

  def index
    @wellbeings = policy_scope(Wellbeing)
    @wellbeings = Wellbeing.all
  end

  def show
    @Wellbeing = Wellbeing.find(params[:id])
    uthorize @wellbeing
  end
end
