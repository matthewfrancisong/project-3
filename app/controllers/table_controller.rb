class TableController < ApplicationController
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
    @admin = Admin.find(current_admin[:id])
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest =Guest.find(params[:table_num])
  end

  def update
    @guest =Guest.find(params[:table_num])
    if @guest.update(post_params)
    else
      render 'edit'
    end
  end

end
