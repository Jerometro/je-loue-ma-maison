class rentalsController < ApplicationController
  before_action :set_house, only: [:new, :create]

  def new
    @rental = rental.new
  end

  SECONDS_IN_MINUTES = 60
  SECONDS_IN_HOURS = SECONDS_IN_MINUTES * 60
  SECONDS_IN_DAYS = SECONDS_IN_HOURS * 24

  def create
    @rental = rental.new(rental_params)
    @rental.house = @house
    days = (@rental.end_date - @rental.start_date).to_i / SECONDS_IN_DAYS + 1
    @rental.price = @house.price_per_day * days
    @rental.user = current_user

    redirect_to dashboard_path and return if @rental.save

    render :new
  end

  def cancel
    @rental = rental.find(params[:id])
    @rental.status = "cancelled"
    @rental.save
    redirect_to dashboard_path
  end

  def accept
    @rental = rental.find(params[:id])
    @rental.status = "accepted"
    @rental.save
    redirect_to dashboard_path

  end

  def deny
    @rental = rental.find(params[:id])
    @rental.status = "denied"
    @rental.save
    redirect_to dashboard_path
  end

  private

  def set_house
    @house = house.find(params[:house_id])
  end

  def rental_params
    params.require(:rental).permit(:end_date, :start_date)
  end
end

