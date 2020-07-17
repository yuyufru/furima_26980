class OrdersController < ApplicationController
  before_action :correct_user, only: [:index, :new, :create,]

  def index
  end

  def new
    @item = Item.find(params[:item_id])
    @order = Order.new(item_id: @item.id)
    @item_purchase = ItemPurchase.new
  end
 
  def create
    @order = Order.new(item_purchase_params)
    if @order.valid?
      @item = Item.find(params[:item_id])
      pay_item
      @order.user = current_user
      @order.item = @item
      @order.save
      return redirect_to root_path
    else
      #render
    end
  end
  
  def correct_user
    unless current_user
      return redirect_to root_path
    end
    item = Item.find(params[:item_id])
    if current_user.id == item.user_id
      return redirect_to root_path
    end
    item_purchase = ItemPurchase.find_by(item_id: params[:item_id])
    if item_purchase 
      return redirect_to root_path
    end  
  end 

private

  def item_order_params
    params.require(:oder).permit(
      :post_code,
      :prefecture,
      :password,
      :city,
      :house_number,
      :building_name,
      :phone_number
    )
  end

  def order_params
    params.permit(:price, :token)
  end
 
  def pay_item
    Payjp.api_key = "sk_test_ebf8b50ea255168efb2b37ef"
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end

  # def item_purchase_params 
  #   params.require(:item_purchase).permit(
  #     :post_code,
  #     :prefecture,
  #     :password,
  #     :city,
  #     :house_number,
  #     :building_name,
  #     :phone_number
  #   )
  # end

end