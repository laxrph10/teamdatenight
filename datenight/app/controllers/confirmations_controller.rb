class ConfirmationsController < ApplicationController

  def index
    @movie = params[:collected_info].split(" |; ")[0]
    @theater_address = params[:collected_info].split(" |; ")[1]
    @time = params[:collected_info].split(" |; ")[2]
    @restaurant_address = params[:collected_info].split(" |; ")[4].split(",")[0][2..-2] + ", " + params[:collected_info].split(" |; ")[4].split(",")[2][2..-1] + ", " + params[:collected_info].split(" |; ")[4].split(",")[3][1..-3]
    @restaurant = params[:collected_info].split(" |; ")[3]

  end

	private
  # Use callbacks to share common setup or constraints between actions.
  def set_restaurant
    @restaurant = Restaurant.new(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def confirmation_params
    params.require(:collected_info).permit(:name)
  end
end
