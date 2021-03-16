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

  # def update
  #   @user = User.find(params[:id])
  #   if @user.update(users_params)
  #     redirect_to root_path
  #   else
  #     render :update
  #   end
  # end     今後使う可能性ある為


  private

  def items_params
    params.require(:item).permit(:image, :price, :item, :explanation, :category_id, :status_id, :fee_id, :address1_id, :day_id).merge(user_id: current_user.id)
    # .merge(user_id: current_user.id)許可したデータに追加でuserテーブルのデータを紐付ける
  end
end

