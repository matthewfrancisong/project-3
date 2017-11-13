class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!

  def index
    @guests = Guest.where(admin_id: current_admin[:id])
    @admin = Admin.find(current_admin[:id])
    #removing table num from table list

    #creating table for guest

    @guest_list = []
    @tables_list = []
    @guestid_list = []
    @admin.num_tables.times do
      @tables_list << []
      @guestid_list << []
    end
    @guests.each do |g|
      if g.table_num
        @tables_list[g.table_num-1] << g.name
        @guestid_list[g.table_num-1] << g.id
      end
        #checking for RSVP
      if g.RSVP != false
        @guest_list << g
      else
        g.table_num = nil
        @guest_list.delete g
      end
        #checking for table_num
      if g.table_num != nil
        @guest_list.delete g
      else
        @tables_list.delete g
      end
        g.save
    end
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find(params[:table_num])
  end

  def update
    # render json: params
    @guest = Guest.find(params[:table_guest_id])
    # render json: @guest
    @guest.update(post_params)
    redirect_to tables_path
  end


  private

  def post_params
  params.require(:guest).permit(:table_num)

  end
end
