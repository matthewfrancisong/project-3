class RsvpsController < ApplicationController
  def show
    @rsvp =Guest.find(params[:id])
    redirect_to root_path
  end

  def edit
    @rsvp =Guest.find(params[:id])
    # if @guest.update(post_params)
      # flash[:success] = "Thank you!"
    #   redirect_to guests_path
    # else
    #   redirect_back fallback_location: root_path
    # end
    #
    # redirect_to new_guest_path
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
