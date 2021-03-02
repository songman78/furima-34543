FactoryBot.define do
  factory :item do
    title { Faker::Name.initials(number: 4) }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    condition_id { 2 }
    delivery_change_id { 2 }
    delivery_days_id { 2 }
    prefecture_id { 2 }
    price { 4999 }
    association :user
  end
end
