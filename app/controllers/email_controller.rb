class EmailController < ApplicationController
  before_action :authenticate_admin!

  def index
    @admin = current_admin
  end

  def create
    @message = (params[:message])
    @admin = current_admin
    @guests = Guest.where(admin_id: current_admin[:id])
    @guests.each do |guest|
      @guest = guest
      EmailMailer.send_all_guest_email(@guest, @message, @admin).deliver
    end
    flash[:notice] = "Email Sent Successfully!"
    redirect_to guests_path
    
  end
end
