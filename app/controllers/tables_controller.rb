class TablesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!



  def index
    @guestlists = current_admin.guests.where(table_num: nil)
                  .where(RSVP: [true, nil])

    @alltabled_guests = current_admin.guests.where.not(table_num: nil)
                        .where(RSVP: [true, nil])


    @table_list = {}

    current_admin.num_tables.times do |i|
      @table_list[i + 1] = []
    end

    @alltabled_guests.each do |tabled_guest|
      @table_list[tabled_guest.table_num] << tabled_guest
    end

    # @table_list[@alltabled_guests.first.table_num - 1] << @alltabled_guests.first

    # render json: {
    #   guestlist: @guestlists,
    #   table_list: @table_list,
    #   alltabled_guests: @alltabled_guests
    # }


    # @guests = Guest.where(admin_id: current_admin[:id])
    # @admin = Admin.find(current_admin[:id])
    # #creating table for guest
    # @guest_list = []
    # @tables_list = []
    # @guestid_list = []
    #
    # @admin.num_tables.times do
    #   @tables_list << []
    #   @guestid_list << []
    # end
    #
    # @guests.each do |g|
    #
    #   if g.table_num
    #     @tables_list[g.table_num-1] << g.name
    #     @guestid_list[g.table_num-1] << g.id
    #   end
    #
    #     #checking for RSVP
    #   if g.RSVP || g.nil?
    #     @guest_list << g
    #   else
    #     g.table_num = nil
    #     @guest_list.delete g
    #   end
    #
    #     #checking for table_num
    #   if g.table_num != nil
    #     @guest_list.delete g
    #   else
    #     @tables_list.delete g
    #   end
    #     g.save
    #
    #   @tables_list.each do |t|
    #     gon.l = t.length > @admin.num_seats
    #     if t.length > @admin.num_seats == true
    #       t.pop
    #     end
    #   end
    #
    #     gon.maxseats = @admin.num_seats
    #     gon.tables = @tables_list
    #     gon.currentseats = @tables_list[0].length
    #
    # end
  end

  def new
    @guest = Guest.new
  end

  def edit
    @guest = Guest.find(params[:table_guest_id])
  end

  def update
    table_number = params[:guest][:table_num].to_i
    @guest = Guest.find(params[:table_guest_id])
    # render json: table_number
    if Guest.group(:table_num).count[table_number] == current_admin.num_seats
      flash[:alert] = ''
      redirect_to tables_path
    else
      @guest.update(post_params)
      redirect_to tables_path
    end

  end

  private
  def post_params
  params.require(:guest).permit(:table_num)
  end
end
