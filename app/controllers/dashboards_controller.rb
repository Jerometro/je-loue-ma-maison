class DashboardsController < ApplicationController
  def show
    @houses = house.where(user: current_user)
    @rentals = rental.where(user: current_user)
    @booked = rental.where(house: current_user.houses)
  end
end
