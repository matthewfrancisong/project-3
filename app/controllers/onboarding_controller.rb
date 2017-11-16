class OnboardingController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :authenticate_admin!

  def index
    @admin = current_admin
  end

  def update
    @admin = current_admin
    if @admin.update(post_params)
      redirect_to guests_path
    else
      render :action => 'index'
    end

  end

  private
  def post_params
  params.require(:admin).permit(:title, :venue, :date, :time, :num_tables, :num_seats, :form_type)
  end

end
