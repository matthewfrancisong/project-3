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

  def edit
    @guest =Guest.find(params[:id])
  end

  def update
    @guest =Guest.find(params[:id])
    if @guest.update(post_params)
      redirect_to guests_path
    else
      render 'edit'
    end
  end

  def destroy
    Guest.destroy(params[:id])
  end

  private
  def post_params
  params.require(:guest).permit(:name, :email)
  end
end
