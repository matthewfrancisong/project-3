class TableController < ApplicationController
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
    @admin = Admin.find(current_admin[:id])
    
  end

  def new
    @guest = Guest.new
  end

end
