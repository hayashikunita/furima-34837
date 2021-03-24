class AddressPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :address1_id, :shikucyouson, :bannchi, :tatemonomei, :phone_number , :purchase_id, :user_id, :item_id, :token


  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shikucyouson 
    validates :bannchi
    validates :phone_number, format: {with: /\A[0-9]{1,11}\z/}
    validates :token
  end
    validates :address1_id, numericality: {other_than: 1, message: "can't be blank"}


  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(address1_id: address1_id, postal_code: postal_code, shikucyouson: shikucyouson, bannchi: bannchi, tatemonomei: tatemonomei, phone_number: phone_number, purchase_id: purchase.id)
  end
end
