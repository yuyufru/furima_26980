class ItemsController < ApplicationController
  before_action :set_item, only: [:destory, :edit, :show, :update]

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
    if item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render :edit
    end
  end  

  def show
  end  

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name, :image, :info, :category, :status, :price, :postage, :prefecture, :shipping_date, :price_tax, :brand).merge(user_id: current_user.id)
  end
end