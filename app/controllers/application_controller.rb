class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :title, :venue, :date, :time, :num_tables, :num_seats])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :title, :venue, :date, :time, :num_tables, :num_seats])
  end
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
  end

  add_flash_types :display
end
