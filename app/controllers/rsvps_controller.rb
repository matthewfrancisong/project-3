class RsvpsController < ApplicationController
  def show
    @guest =Guest.find(params[:id])
  end

  def edit
    @guest =Guest.find(params[:id])
  end

  private
  def post_params
  params.require(:guest).permit(:RSVP)
  end
end
