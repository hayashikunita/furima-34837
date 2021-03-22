class AddressPurchase

  include ActiveModel::Model
  attr_accessor :postal_code, :address1_id, :shikucyouson, :bannchi, :tatemonomei, :phone_number , :purchase_id, :user_id, :item_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shikucyouson 
    validates :bannchi
    validates :phone_number
  end
  validates :address1_id, numericality: {other_than: 0, message: "can't be blank"}

  def save

    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code, shikucyouson: shikucyouson, bannchi: bannchi, tatemonomei: tatemonomei, phone_number: phone_number, purchase_id: purchase.id)

  end
end


# コントローラーにここにmergeのところに、item_idが必要になる。purchaseかAddressで


# | Column | Type   | Options     |
# | ------ | ------ | ----------- |
# | postal_code       | string | null: false |
# | address1_id       | integer| null: false |
# | shikucyouson      | string | null: false |
# | bannchi           | string | null: false |
# | tatemonomei       | string |
# | phone_number      | string | null: false |
# | purchase          | references | null: false, foreign_key: true |

# | Column | Type   | Options     |
# | ------ | ------ | ----------- |
# | user  | references | null: false, foreign_key: true |
# | item  | references | null: false, foreign_key: true |