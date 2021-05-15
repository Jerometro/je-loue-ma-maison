class housesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_house, only: [:destroy, :show, :edit, :update]

  def index
    @houses = house.all.order(created_at: :desc)
  end

  def show
    @rental = rental.new
    @house = house.find(params[:id])
  end

  def new
    @house = house.new
  end

  def create
    @house = house.new(house_params)
    @house.user = current_user
    @house.save ? (redirect_to dashboard_path) : (render :new)
  end

  def destroy
    @house.destroy
    redirect_to dashboard_path
  end

  def edit
  end

  def update
    if @house.update(house_params)
      redirect_to dashboard_path
    else
      render :edit
    end
  end

  private

  def set_house
    @house = house.find(params[:id])
  end

  def house_params
    params.require(:house).permit(:address, :price_per_day, :photo)
  end
end
