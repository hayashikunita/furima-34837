class ItemsController < ApplicationController
  
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(items_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def items_params
    params.require(:item).permit(:image, :price, :item, :explanation, :category_id, :status_id, :fee_id, :address1_id, :day_id).merge(user_id: current_user.id)
  end
end

