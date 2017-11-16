class GuestsController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!

  def index
    @guests = Guest.where(admin_id: current_admin[:id])
    $response = Guest.where(admin_id: current_admin[:id]).group(:RSVP).count
  end


  def create
    if current_admin.guests.create(post_params)[:id]
    flash[:notice] = "#{post_params[:name]} has been added to the list!"
    redirect_to new_guest_path
    else
      flash[:notice] = "Name & E-mail cannot be blank."
      redirect_to new_guest_path
    end
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
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    Guest.destroy(params[:id])
    redirect_to guests_path
  end

  private
  def post_params
  params.require(:guest).permit(:name, :email, :RSVP, :table_num, :check_in)
  end
end
