class AddressesController < ApplicationController
  def user_params
    params.require(:user).permit(
      :post_code,
      :prefecture,
      :password,
      :city,
      :house_number,
      :building_name,
      :phone_number,
  end
  def new
    @address = Address.new
  end    
end
