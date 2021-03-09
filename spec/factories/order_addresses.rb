FactoryBot.define do
  factory :order_address do
    zip_code1 { '123-4567' }
    prefecture_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building { '東京ハイツ' }
    phone_number { "09012345678" }
    order_id {1}
    token {"tok_abcdefghijk00000000000000000"}
    user_id {1}
    item_id {1}
  end
end
