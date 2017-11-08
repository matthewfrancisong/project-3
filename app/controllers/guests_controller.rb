class GuestsController < ApplicationController
  def index
    @guests = Guest.all
  end

  def create
    current_admin.guests.create(params.require(:guest).permit(:name))
    redirect_to new_guest_path
  end

  def new
    @new_guest = Guest.new
  end
end
