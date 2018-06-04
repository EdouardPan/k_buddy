class SymptomsController < ApplicationController
  before_action :set_symptom, only: [:show, :edit, :update, :destroy]

  def index
    @symptoms = policy_scope(Symptom)
    # if params[:query].present?
    #   @symptoms = @symptoms.search_symptom(params[:query])
    # end

    # Month view
    @symptoms_grouped = @symptoms.group_by do |symptom|
      symptom.start_date.to_date
    end

    @symptoms_js = []
    @symptoms_grouped.each do |date_event|
      data = {
        title: '',
        start: date_event[0].to_date,
        iconS: true
      }
      @symptoms_js << data
    end

    @events_month = @symptoms_js

    # Day view
    @symptoms_js = []
    @symptoms.each do |event|
      data = nil
      data = {
        title: "#{event.name} - #{event.intensity}/10",
        start: event.start_date.strftime("%Y-%m-%dT%H:%M:%S"),
        end: event.end_date.strftime("%Y-%m-%dT%H:%M:%S"),
        iconS: true
      }
      @symptoms_js << data
    end

    @events_day = @symptoms_js
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
    if @symptom.save
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

  def search

  end

private

  def set_symptom
    @symptom = Symptom.find(params[:id])
  end

  def symptom_params
    params.require(:symptom).permit(:start_date, :end_date, :name, :intensity, :description)
  end
end





