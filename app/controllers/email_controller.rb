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
    redirect_to guests_path
    flash[:alert] = ""
    $email_sent = true

  end
end
