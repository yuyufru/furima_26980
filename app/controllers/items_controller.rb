class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new
    if @item.images.present?
      @item.save
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def destroy
    item = Item.find(params[:id])
    if item.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def edit
    @item = Item.new
  end




end