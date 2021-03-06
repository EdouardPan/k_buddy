class ApplicationController < ActionController::Base
  protect_from_forgery
  before_action :authenticate_user!

  include Pundit

  # Pundit: white-list approach.
  after_action :verify_authorized, except: [:index, :today_tasks], unless: :skip_pundit?
  after_action :verify_policy_scoped, only: [:index, :today_tasks], unless: :skip_pundit?

  # Uncomment when you *really understand* Pundit!
  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def default_url_options
  { host: ENV["HOST"] || "www.kbuddy.org" }
  end

  private

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :zipcode, :birthday, :sex])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :zipcode, :birthday, :sex])
  end

  def after_sign_in_path_for(ressources)
    "/todaytasks"
  end

  def after_sign_up_path_for(ressources)
    "/todaytasks"
  end

end
