class GuestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!
  
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
  end

  def create
    current_admin.guests.create(post_params)
    redirect_to new_guest_path
  end

  def new
    @new_guest = Guest.new
  end

  def update

  end

  def destroy
    Guest.destroy(params[:id])
  end

  private
  def post_params
  params.require(:guest).permit(:name)
  end
end
