class PurchasesController < ApplicationController


  def index
    @address_purchase = AddressPurchase.new
    @item = Item.find(params[:item_id])
    # 一つだけの時はこの記述
    # 使わないといけないわけではない
    # よそのモデルから参照するときは、、、コントローラーをまたいで使う時にこうなる
    # /items/:item_id/purchases(.:format)  の:item_id
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
    # @donation_address = DonationAddress.new(donation_params)
    # if @donation_address.valid?
    #   @donation_address.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end
  
  private

  def purchase_params
    params.require(:address_purchase).permit(:postal_code, :address1_id, :shikucyouson, :bannchi, :tatemonomei, :phone_number , :purchase_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = "sk_test_827629334d9cfd104eb8b8f1" 
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: purchase_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
