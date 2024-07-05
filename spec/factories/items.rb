FactoryBot.define do
  factory :item do
    association :user
    name { "Custom Item Name" }
    description { Faker::Lorem.paragraph }
    price { Faker::Number.between(from: 300, to: 9_999_999) }
    category_id { Faker::Number.between(from: 2, to: 10) }
    condition_id { Faker::Number.between(from: 2, to: 7) }
    postage_payer_id { Faker::Number.between(from: 2, to: 3) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    ship_date_estimate_id { Faker::Number.between(from: 2, to: 4) }

    after(:build) do |item|
      item.image.attach(io: File.open(Rails.root.join('spec/fixtures/files/item-sample.png')), filename: 'item-sample.png')
    end
  end
end
