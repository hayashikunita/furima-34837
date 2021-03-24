FactoryBot.define do
  factory :address_purchase do

  postal_code { '111-1234' }
  shikucyouson { '横浜市' }
  bannchi { '横浜' }
  phone_number { '12345678' }
  address1_id { 2 }
  token {"tok_abcdefghijk00000000000000000"}
  tatemonomei {"あああ"}
  end
end

# association :user
