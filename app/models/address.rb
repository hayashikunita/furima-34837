class Address < ApplicationRecord

  with_options presence: true do
    validates :postal_code
    validates :address1_id
    validates :shikucyouson
    validates :bannchi
    validates :phone_number
    validates :purchase
  end



belongs_to :purchase

end