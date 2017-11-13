class RsvpsController < ApplicationController
  def show
    @rsvp =Guest.find(params[:id])
    redirect_to root_path
  end

  def edit
    @rsvp =Guest.find(params[:id])
  end

  def update
    @rsvp =Guest.find(params[:id])
    @rsvp.update(post_params)
    redirect_to rsvp_path
    flash[:alert] = "Your response has been recorded. Thank you!"
  end

  private
  def post_params
  params.require(:guest).permit(:RSVP)
  end
end
