class AddressesController < ApplicationController
  
  def new
    @address = Address.new
  end    

private
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

end
