class TablesController < ApplicationController
  def index
    @guests = Guest.where(admin_id: current_admin[:id])
    @admin = Admin.find(current_admin[:id])
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find(params[:table_num])
  end

  def update
    @guest = Guest.find(params[:table_guest_id])
    @guest.update(post_params)
    redirect_to tables_path
  end

  private
  def post_params
  params.require(:guest).permit(:table_num)
  end
end
