class ItemsController < ApplicationController
  before_action :set_item, only: [:destroy, :edit, :show, :update]
  before_action :correct_user, only: [:new, :create, :edit, :update, :destroy, :order, :purchase]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path, notice: '削除しました'
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      
    else
      render :edit
    end
  end  
  
  def order
    @item = Item.find(params[:id])
    # redirect_to root_path
  end  

  def purchase
    @item_purchase = UserPurchase.new(item_purchase_params) 
    # redirect_to root_path
  end

  def correct_user
    @correct_user = current_user(user_params)
      unless @correct_user
        redirect_to root_path
      end
  end 

  # def done
    #   @item_purchase = UserPurchase.new(item_purchase_params) 
    # end  

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name, 
      :image, 
      :info, 
      :category, 
      :status, 
      :price, 
      :postage, 
      :prefecture, 
      :shipping_date, 
      :price_tax, 
      :brand).merge(user_id: current_user.id)
  end

  # def item_purchase_params
  #   params.require(:item_purchase).permit(
  #     :post_code,
  #     :prefecture,
  #     :city,
  #     :house_number,
  #     :phone_number
  #   )
  # end
end


# def index
#   @item = Item.find(params[:item_id])
# end  

#