class ProfileController < ApplicationController

  def show
    @profile = current_user
    authorize @profile
  end

  def edit
    @profile = current_user
    authorize @profile
  end

  def update
    @profile = current_user
    authorize @profile
    if @profile.update(profile_params)
      redirect_to profile_path(@profile)
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:current_user).permit(:first_name, :last_name, :zipcode, :birthday, :sex)
  end

end

