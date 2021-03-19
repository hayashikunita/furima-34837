FactoryBot.define do
  factory :item do
    price { 1111 }
    item { '本' }
    explanation { 'この本は、名著です' }
    category_id { 2 }
    status_id { 2 }
    fee_id { 2 }
    address1_id { 2 }
    day_id { 2 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
