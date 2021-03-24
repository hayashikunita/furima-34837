class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:create, :index]


  def index
    @address_purchase = AddressPurchase.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
       pay_item
       @address_purchase.save
       redirect_to root_path
    else
      render :index
    end
  end
  
  private

  def purchase_params
    params.require(:address_purchase).permit(:postal_code, :address1_id, :shikucyouson, :bannchi, :tatemonomei, :phone_number , :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_827629334d9cfd104eb8b8f1" 
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_params[:token], 
      currency: 'jpy' 
    )
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user.id
  end

end
