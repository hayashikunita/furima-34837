class PurchasesController < ApplicationController


  def index
    
  end

  def create
    @address_purchase = AddressPurchase.new(purchase_params)
    if @address_purchase.valid?
       @address_purchase.save
       redirect_to root_path
    # else
    #   render :new
    end




    # @donation_address = DonationAddress.new(donation_params)
    # if @donation_address.valid?
    #   @donation_address.save
    #   redirect_to root_path
    # else
    #   render :new
    # end
  end
end
