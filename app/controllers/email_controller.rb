class EmailController < ApplicationController
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
  end
end
